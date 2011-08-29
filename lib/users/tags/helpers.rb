module Users
  module Tags
    class Helpers
      class << self
        include ActionView::Helpers::NumberHelper

        def current_logged_in_user(tag)
          if user_id = tag.locals.page.request.session[:user_id]
            User.find_by_id(user_id)
          end
        end

        def current_impersonated_customer(tag)
          if customer_id = tag.locals.page.request.session[:impersonated_customer_id]
            ShopCustomer.find_by_id(customer_id)
          end
        end

        def current_user(tag)
          current_impersonated_customer(tag) || current_logged_in_user(tag)
        end

      end
    end
  end
end
