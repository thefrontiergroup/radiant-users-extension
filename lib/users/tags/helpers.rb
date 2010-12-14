module Users
  module Tags
    class Helpers
      class << self
        include ActionView::Helpers::NumberHelper
        
        def current_user(tag)
          begin
            user_id = tag.locals.page.request.session['user_id']
            User.find(user_id)
          rescue
            return false
          end
        end
        
      end
    end
  end
end