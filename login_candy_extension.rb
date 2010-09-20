class LoginCandyExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://github.com/crankin/radiant-login_candy-extension"

  def activate
    
    # Models
    User.send :include, LoginCandy::Models::User
    
    # Controllers
    ApplicationController.send :include, LoginCandy::Lib::LoginSystem
    
    Radiant::Config['login.visitor_url'] ||= '/visitors'
  end
end
