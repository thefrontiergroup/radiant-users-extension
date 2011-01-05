module Users
  module Controllers
    module ApplicationController
      
      def self.included(base)
        base.class_eval do
          
          def default_admin_path
            admin_pages_path
          end
          
        end
      end
      
    end
  end
end