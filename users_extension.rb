require 'radiant-users-extension/version'

class UsersExtension < Radiant::Extension
  version RadiantUsersExtension::VERSION
  description "Adds users to Radiant."
  url "http://github.com/dirkkelly/radiant-users-extension"
  
  extension_config do |config|    
    config.gem 'devise'
  end
  
  def activate
    Page.send                      :include, Users::Tags::Core
    
    SiteController.send            :include, Users::Controllers::SiteController
    
    ApplicationController.send     :include, Users::Controllers::ApplicationController
    
    Admin::ResourceController.send :include, Users::Controllers::Admin::ResourceController
    
    Admin::WelcomeController.send  :include, Users::Controllers::Admin::WelcomeController
    
    SessionsController.send        :include, Users::Controllers::Devise::SessionsController
    PasswordsController.send       :include, Users::Controllers::Devise::PasswordsController
    ConfirmationsController.send   :include, Users::Controllers::Devise::ConfirmationsController
    RegistrationsController.send   :include, Users::Controllers::Devise::RegistrationsController
    
    Devise::Controllers::InternalHelpers.send :include, Users::Lib::Devise::Controllers::InternalHelpers
    
    Radiant::Config['site.host'] ||= 'localhost:3000'
    ActionMailer::Base.default_url_options = { :host => Radiant::Config['site.host'] }
  end
end
