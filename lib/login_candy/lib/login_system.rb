module LoginCandy
  module Lib
    module LoginSystem
      def self.included(base)
        base.class_eval do
          protected
            def authorize
              action = action_name.to_s.intern
              if !user_has_backend_access?
                respond_to do |format|
                  format.html { redirect_to(Radiant::Config['login.visitor_url']) }
                  format.any(:xml, :json) { head :forbidden }
                end
              elsif !user_has_access_to_action?(action)
                permissions = self.class.controller_permissions[action]
                flash[:error] = permissions[:denied_message] || 'Access denied.'
                respond_to do |format|
                  format.html { redirect_to(permissions[:denied_url] || { :action => :index }) }
                  format.any(:xml, :json) { head :forbidden }
                end
                false
              else
                true
              end
            end
            
            def user_has_backend_access?
              (current_user.access != 'front')
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