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

          def current_impersonated_customer
            if customer_id = session[:impersonated_customer_id]
              user = User.find_by_id(customer_id)
              return user if user.present?
              # Remove stale ids from the session just in case
              session.delete[:impersonated_customer_id]
            end
          end

          def impersonating_customer?
            current_impersonated_customer.present?
          end

          def stop_impersonating_customer
            session[:impersonated_customer_id] = nil
            session.merge!(session.delete(:old_session)) if session.key?(:old_session)
          end

          def impersonate_customer(customer_id)
            session[:old_session] = {:shop_order => session.delete(:shop_order)} if session.key?(:shop_order)
            session[:impersonated_customer_id] = customer_id
          end

          def current_user
            @current_user ||= (current_impersonated_customer || current_user_radiant || login_from_api_key)
          end

          def login_from_api_key
            result = nil
            if params[:api_key].present?
              result = User.find_by_api_key(params[:api_key])
            else
              authenticate_with_http_basic do |api_key,_|
                result = User.find_by_api_key(api_key)
              end
            end
            result
          end 
        end
      end

    end
  end
end
