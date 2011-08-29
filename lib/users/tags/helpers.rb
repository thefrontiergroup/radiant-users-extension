module Users
  module Tags
    module Helpers
      include ActionView::Helpers::NumberHelper

      def current_logged_in_user
        if user_id = tag.locals.page.request.session[:user_id]
          User.find_by_id(user_id)
        end
      end

      def current_impersonated_customer
        if customer_id = request.session[:impersonated_customer_id]
          ShopCustomer.find_by_id(customer_id)
        end
      end

      def current_user(tag)
        current_impersonated_customer || current_logged_in_user
      end

    end
  end
end
