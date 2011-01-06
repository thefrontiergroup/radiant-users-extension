# Users

* Radiant is lovely <3
* The user authentication system works.
* This extension replaces that working system with Devise.
* Devise also works
* Radiant-Users-Extension is also lovely <3

# Installing
  
    git clone git@github.com:dirkkelly/radiant-users-extension vendor/extensions/users
    cd vendor/extensions/users
    git checkout devise
    cd ../../../
    rake radiant:extensions:users:migrate

# Registrations

You will need to override the Devise definition in the user model

    User.class_eval do
    
      devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :token_authenticatable, :validatable
    
    end

You can set a custom class_name on new registrations

    User.class_eval do
    
      protected
      
      def set_class_name
        self.class_name ||= "Visitor"
      end
    
    end

# Migration

* Passwords do not need to change, the migration will take care of updating these
* Emails are now required for every user. You will get warned of users with missing emails and a dummy address _set@email.com_ will be applied

Field changes

    login    => username (setter and getter abstracted out)
    password => encrypted_password
    salt     => password_salt

# Inheriting Classes

_actually, this doesn't exist yet_

User has a field `class_name`, when you inherit a class this will get set.

If this field is not nil, the user will not have access to the administration system.

# Development and Testing

This extension uses the following gems, define them in a development and test group.

    group :development do
      gem 'ruby-debug',                     '~> 0.10.3'
      gem 'jeweler',                        '~> 1.5.2'
      gem 'rspec-rails',                    '~> 1.3.2'
      gem 'remarkable',                     '3.1.12', :git => 'https://github.com/joerichsen/remarkable.git', :branch => 'rspec1-compat'
      gem 'remarkable_rails',               '3.1.12', :require => 'remarkable_rails'
    end

    group :test do
      gem 'rspec',                          '~> 1.3.1'
      gem 'rspec-rails',                    '~> 1.3.2'
      gem 'remarkable',                     '3.1.12', :git => 'https://github.com/joerichsen/remarkable.git', :branch => 'rspec1-compat'
      gem 'remarkable_rails',               '3.1.12', :require => 'remarkable_rails'
      gem 'cucumber-rails',                 '~> 0.2.4'
      gem 'database_cleaner',               '~> 0.4.3'
      gem 'webrat',                         '~> 0.6.0'
      gem 'rr',                             '~> 0.10.11'
      gem 'rcov',                           '~> 0.9.9'
    end
    
# LICENCE

This extension was developed by [Dirk Kelly](http://twitter.com/dirkkelly) on [The Frontier Group's](http://twitter.com/frontiergroup) Time. It is licenced as MIT.