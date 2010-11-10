module Users
  module Models
    module User
      
      def self.included(base)
        base.class_eval do
          attr_protected :access
          after_initialize :generate_api_key
          
          def generate_api_key
            begin
              self.api_key = self.sha1(Time.now + Radiant::Config['session_timeout'].to_i)
            rescue
              logger.error "attempt to create api key failed - please migrate radiant-scoped-extension"
            end
          end
        end
      end
      
    end
  end
end