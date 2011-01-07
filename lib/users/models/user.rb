module Users
  module Models
    module User
      
      def self.included(base)
        base.class_eval do
          attr_protected :access
          after_initialize :generate_api_key
          
          def generate_api_key
            begin
              self.api_key = ActiveSupport::SecureRandom.hex(18) unless api_key.present?
            rescue
              logger.error "attempt to create api key failed - please migrate radiant-users-extension"
            end
          end
        end
      end
      
    end
  end
end