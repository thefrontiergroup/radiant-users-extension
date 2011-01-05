module Users
  module Controllers
    module Admin
      module ResourceController
      
        def self.included(base)
          base.class_eval do
            
            before_filter :authenticate_user!
            
          end
        end
      
      end
    end
  end
end