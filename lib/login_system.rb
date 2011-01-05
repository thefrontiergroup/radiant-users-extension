module LoginSystem
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  # Empty
  
  module ClassMethods
    def no_login_required
      # Nil
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
      when allowed_roles = permissions[:when]
        allowed_roles = [allowed_roles].flatten
        allowed_roles.any? { |role| user.has_role?(role) }
      when condition_method = permissions[:if]
        instance.send(condition_method)
      else
        true
      end
    end
  end
  
end