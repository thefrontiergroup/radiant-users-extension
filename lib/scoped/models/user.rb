module Scoped
  module Models
    module User
      
      def self.included(base)
        base.class_eval do
          attr_protected :access
          after_initialize :generate_api_key
          
          def generate_api_key
            if self.api_key.nil?
              self.api_key = self.sha1(Time.now + Radiant::Config['session_timeout'].to_i)
            end
          end
        end
      end
      
    end
  end
end