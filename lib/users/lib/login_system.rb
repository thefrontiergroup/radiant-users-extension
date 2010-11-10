module Users
  module Lib
    module LoginSystem
      
      def self.included(base)
        base.class_eval do
          protected
            alias_method :authorize_radiant, :authorize
            alias_method :current_user_radiant, :current_user
            
            def authorize
              if user_has_backend_access?
                authorize_radiant
              else
                path = Radiant::Config["scoped.#{current_user.access}.welcome"]
                path = "/#{path}".gsub('//','/')
                
                respond_to do |format|
                  format.any(:html, :xml, :json) { redirect_to(path) }
                end
              end
            end

            def user_has_backend_access?
              current_user.access.blank?
            end
            
            def current_user
              @current_user ||= (current_user_radiant || login_from_api_key)
            end

            def login_from_api_key
              self.current_user = User.find_by_api_key(params[:api_key]) if params[:api_key].present?
            end 
        end
      end
      
    end
  end
end