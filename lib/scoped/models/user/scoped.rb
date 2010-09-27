module Scoped
  module Models
    module User
      module Scoped
      
        def self.included(base)
          base.class_eval do
            default_scope :conditions => { :access => self.name.to_s.gsub(/\B[A-Z]/, '_\&').downcase }
          end
        end
        
      end
    end
  end
end