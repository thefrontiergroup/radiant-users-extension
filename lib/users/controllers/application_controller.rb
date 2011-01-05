module Users
  module Controllers
    module ApplicationController
      
      def self.included(base)
        base.class_eval do
          
          before_filter :authenticate_user!
          
          def default_admin_path
            admin_pages_path
          end
          
        end
      end
      
    end
  end
end