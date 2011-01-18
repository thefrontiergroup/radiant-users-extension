module LoginSystem
  
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      prepend_before_filter :authenticate_user
    end
  end
  
  def authenticate_user
    authenticate_user!
  end
  
  def authenticate_user_with_authorize
    if authenticate_user_without_authorize
      action = action_name.to_s.intern
      if user_has_access_to_action?(action)
        true
      else
        permissions   = self.class.controller_permissions[action]
        flash[:error] = permissions[:denied_message] || 'You must have moderator privileges to perform this action.'
        respond_to do |format|
          format.html { redirect_to(default_admin_path) }
          format.any(:xml, :json) { head :forbidden }
        end
        false
      end
    else
      redirect_to after_sign_out_path_for(current_user)
      false
    end
  end
  alias_method_chain :authenticate_user, :authorize
  
  def user_has_access_to_action?(action)
    self.class.user_has_access_to_action?(current_user, action, self)
  end
  
  module ClassMethods
    def no_login_required
      # skip_before_filter :authenticate_user
      # Not working in some systems
    end
    
    def only_allow_access_to(*args)
      options = {}
      options = args.pop.dup if args.last.kind_of?(Hash)
      options.symbolize_keys!
      actions = args.map { |a| a.to_s.intern }
      actions.each do |action|
        controller_permissions[action] = options
      end
    end
    
    def controller_permissions
      @controller_permissions ||= Hash.new { |h,k| h[k.to_s.intern] = Hash.new }
    end
    
    def user_has_access_to_action?(user, action, instance=new)
      permissions = controller_permissions[action.to_s.intern]
      case
      when allowed_roles = permissions[:when] || [:administrator,:designer,:user]
        allowed_roles = [allowed_roles].flatten
        allowed_roles.include? user.class_name.downcase.to_sym
      when condition_method = permissions[:if]
        instance.send(condition_method)
      else
        true
      end
    end
  end
  
end