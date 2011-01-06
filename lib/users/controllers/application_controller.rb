module Users
  module Controllers
    module ApplicationController
      
      def self.included(base)
        base.class_eval do
          
          private
          
          def default_admin_path
            default_user_path || admin_pages_path
          end
          
          def default_user_path
            Radiant::Config["defaults.path.#{current_user.class_name.downcase}"]
          end
          
        end
      end
      
    end
  end
end