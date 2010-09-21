class ScopedExtension < Radiant::Extension
  version "0.1"
  description "Scoped allows you to create non-admin users with API access"
  url "http://github.com/squaretalent/radiant-scoped-extension"

  def activate
    # Models
    User.send :include, Scoped::Models::User
    
    # Controllers
    ApplicationController.send :include, Scoped::Lib::LoginSystem
  end
end