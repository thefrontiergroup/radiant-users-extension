class UsersExtension < Radiant::Extension
  version "0.0.1"
  description "Users allows you to create non-admin users with API access"
  url "http://github.com/dirkkelly/radiant-users-extension"

  def activate
    # Models
    User.send :include, Users::Models::User
    
    # Controllers
    ApplicationController.send :include, Users::Lib::LoginSystem
  end
end