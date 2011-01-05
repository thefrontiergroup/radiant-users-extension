module Users
  module Controllers
    module SessionsController
      
      def self.included(base)
        base.class_eval do
          
          def set_standard_body_style
            @body_classes ||= []
            @body_classes
          end
          
        end
      end
      
    end
  end
end