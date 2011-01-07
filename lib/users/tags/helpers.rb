module Users
  module Tags
    class Helpers
      class << self
        
        def current_user(tag)
          User.find_by_id(tag.locals.page.request.session['user_id'])
        end
        
      end
    end
  end
end