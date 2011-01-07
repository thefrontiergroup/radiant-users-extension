module Users
  module Models
    module User
      module Scoped
      
        def self.included(base)
          base.class_eval do
            default_scope :conditions => { :access => self.name.underscore }
          end
        end
        
      end
    end
  end
end