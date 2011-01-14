module Users
  module Lib
    module Devise
      module Controllers
        module InternalHelpers
          
          def self.included(base)
            
            base.class_eval do
              
              def set_flash_message(key, kind, now=false)
                type = [:invalid, :alert, :unauthenticated].include?(kind) ? :error : kind
                type = [:error].include?(type) ? type : :notice
                
                flash[type] = I18n.t(:"#{kind}", 
                  :scope => [:devise, controller_name.to_sym], :default => kind)
              end
              
              def after_sign_in_path_for(resource)
                default_admin_path
              end
              
            end
          end
          
        end
      end
    end
  end
end

