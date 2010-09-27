module Scoped
  module Lib
    module LoginSystem
      
      def self.included(base)
        base.class_eval do
          protected
            alias_method :authorize_radiant, :authorize
            
            def authorize
              if user_has_backend_access?
                authorize_radiant
              else
                path = Radiant::Config["scoped.#{current_user.access}.welcome"]
                
                respond_to do |format|
                  format.html { redirect_to("/#{path}" || welcome_path ) }
                  format.any(:xml, :json) { head :forbidden }
                end
              end
            end

            def user_has_backend_access?
              begin 
                current_user.access.blank?
              rescue
                "Scoped Extension has not been migrated"
              end
            end
          
            def current_user
              @current_user ||= (login_from_session || login_from_cookie || login_from_api_key || login_from_http)
            end

            def login_from_api_key
              self.current_user = User.find_by_api_key(params[:api_key]) unless params[:api_key].nil?
            end 
        end
      end
      
    end
  end
end