# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
require 'radiant-users-extension/version'
class UsersExtension < Radiant::Extension
  version RadiantUsersExtension::VERSION
  description "Adds users to Radiant."
  url "http://github.com/dirkkelly/radiant-users-extension"
  
  def activate
    SiteController.send            :include, Users::Controllers::SiteController
    ApplicationController.send     :include, Users::Controllers::ApplicationController
    Admin::ResourceController.send :include, Users::Controllers::Admin::ResourceController
    Admin::WelcomeController.send  :include, Users::Controllers::Admin::WelcomeController
    
    SessionsController.send        :include, Users::Controllers::SingleFormBodyStyles
    PasswordsController.send       :include, Users::Controllers::SingleFormBodyStyles
    ConfirmationsController.send   :include, Users::Controllers::SingleFormBodyStyles
    
    Devise::Controllers::InternalHelpers.send :include, Users::Lib::Devise::Controllers::InternalHelpers
    
    Radiant::Config['site.host'] ||= 'localhost:3000'
    ActionMailer::Base.default_url_options = { :host => Radiant::Config['site.host'] }
  end
end
