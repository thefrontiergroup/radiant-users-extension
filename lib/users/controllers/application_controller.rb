module Users
  module Controllers
    module ApplicationController
      
      def self.included(base)
        base.class_eval do
          
          private
          
          def default_admin_path
            default_user_path || root_path
          end
          
          def default_user_path
            return false unless user_signed_in?
            return '/admin/pages' if user_has_access_to_action?(:index)
            Radiant::Config["defaults.path.#{current_user.class_name.downcase}"]
          end
          
        end
      end
      
    end
  end
end