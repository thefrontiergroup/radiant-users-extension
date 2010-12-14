class UsersExtension < Radiant::Extension
  version YAML::load_file(File.join(File.dirname(__FILE__), 'VERSION'))
  description "Users allows you to create non-admin users with API access"
  url "http://github.com/dirkkelly/radiant-users-extension"

  def activate
    # Tags
    Page.send :include, Users::Tags::Core
    
    # Models
    User.send :include, Users::Models::User
    
    # Controllers
    ApplicationController.send :include, Users::Lib::LoginSystem
  end
end