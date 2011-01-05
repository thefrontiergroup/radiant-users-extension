module Users
  module Controllers
    module SingleFormBodyStyles
      
      def self.included(base)
        base.class_eval do
          
          def set_standard_body_style
            @body_classes ||= []
            @body_classes.concat(%w(single_form))
          end
          
          def after_sign_out_path_for(resource)
            new_user_session_path
          end
          
          def after_sign_in_path_for(resource)
            # TODO class based redirect
            default_admin_path
          end
          
        end
      end
      
    end
  end
end