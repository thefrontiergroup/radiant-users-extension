module Users
  module Tags
    class Helpers
      class << self
        
        def current_user(tag)
          begin
            User.find(tag.locals.page.request.session['user_id'])
          rescue
            nil
          end
        end
        
      end
    end
  end
end