module Users
  module Tags
    module Core
      include Radiant::Taggable
      
      tag 'user' do |tag|
        return if tag.locals.page.cache?
        
        tag.locals.user = Helper.current_user(tag)
        
        tag.expand
      end
      
      desc %{ will expand if the user is logged in }
      tag 'user:if_user' do |tag|
        tag.expand if tag.locals.user.present?
      end
      
      desc %{ will expand if the user is not logged in}
      tag 'user:unless_user' do |tag|
        tag.expand unless tag.locals.user.present?
      end
      
      desc %{ will expand if the user can access radiant }
      tag 'user:if_authorized' do |tag|
        tag.expand if tag.locals.user.authorized?
      end
      
      desc %{ will expand if the user can not access radiant }
      tag 'user:unless_authorized' do |tag|
        tag.expand unless tag.locals.user.authorized?
      end
      
      [:name, :login, :username, :email, :class_name].each do |symbol|
        desc %{ outputs the #{symbol} of the current user }
        tag "user:#{symbol}" do |tag|
          return unless tag.locals.user.present?
          
          tag.locals.user.send(symbol)
        end
      end
      
    end
  end
end