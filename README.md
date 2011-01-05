# Users

* Radiant is lovely <3
* The user authentication system works.
* This extension replaces that working system with Devise.
* Devise also works
* Radiant-Users-Extension is also lovely <3

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