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
              
            end
          end
          
        end
      end
    end
  end
end

