module Users
  module Controllers
    module SiteController
      
      def self.included(base)
        base.class_eval do
          skip_before_filter :authenticate_user
        end
      end
      
    end
  end
end