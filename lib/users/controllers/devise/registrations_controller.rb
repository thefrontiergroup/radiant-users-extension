module Users
  module Controllers
    module Devise
      module RegistrationsController
      
        def self.included(base)
          include Users::Controllers::SingleFormBodyStyles
          
          base.class_eval do
            skip_before_filter :authenticate_user, :only => [ :new, :create ]
          end
        end
      
      end
    end
  end
end