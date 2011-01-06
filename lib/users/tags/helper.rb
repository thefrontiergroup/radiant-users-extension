module Users
  module Tags
    class Helper
      class << self
        
        def current_user(tag)
          UserActionObserver.current_user
        end
        
      end
    end
  end
end