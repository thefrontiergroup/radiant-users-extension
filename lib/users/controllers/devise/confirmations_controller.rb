module Users
  module Controllers
    module Devise
      module ConfirmationsController
      
        def self.included(base)
          include Users::Controllers::SingleFormBodyStyles
          
          base.class_eval do
            skip_before_filter :authenticate_user, :only => [ :new, :create, :show ]
          end
        end
      
      end
    end
  end
end