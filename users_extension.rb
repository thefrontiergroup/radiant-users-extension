# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
require 'radiant-users-extension/version'
class UsersExtension < Radiant::Extension
  version RadiantUsersExtension::VERSION
  description "Adds users to Radiant."
  url "http://github.com/dirkkelly/radiant-users-extension"
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    # tab 'Content' do
    #   add_item "Users", "/admin/users", :after => "Pages"
    # end
  end
end
