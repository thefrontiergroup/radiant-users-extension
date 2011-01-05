module Users
  module Controllers
    module Admin
      module WelcomeController
        
        def self.included(base)
          base.class_eval do
            
            def index
              redirect_to default_admin_path
            end
            
          end
        end
        
      end
    end
  end
end