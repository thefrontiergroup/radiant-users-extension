module Scoped
  module Models
    module User
      def self.included(base)
        base.class_eval do
          before_create :generate_api_key
        end
      end

      def generate_api_key
        begin
          self.api_key = self.sha1(Time.now + Radiant::Config['session_timeout'].to_i) 
        rescue
          "Scoped Extension has not been migrated"
        end
      end  
    end
  end
end