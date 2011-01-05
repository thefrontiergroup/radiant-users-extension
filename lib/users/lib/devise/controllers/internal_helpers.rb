module Users
  module Lib
    module Devise
      module Controllers
        module InternalHelpers
          
          def self.included(base)
            
            base.class_eval do
              
              def set_flash_message(key, kind, now=false)
                kind = [:invalid, :alert].include?(kind) ? :error : kind
                
                flash[kind] = I18n.t(:"#{resource_name}.#{kind}", 
                  :scope => [:devise, controller_name.to_sym], :default => kind)
              end
              
            end
          end
          
        end
      end
    end
  end
end

