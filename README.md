# Radiant Scoped Extension

Hook standard Radiant users to provide front end user creation and login.

A good example comes from [radiant-shop-extension](http://github.com/squaretalent/radiant-shop-extension) in the use of customers

## Create a Model

    class ShopCustomer < User
      include Scoped::Models::User::Scoped
    end

When a customer is created the access attributes present status will prevent them from accessing the administration system.

## Define Their Welcome Page

    Radiant::Config['scoped.shop_customer.redirect'] = '/cart'

## API Access

Login Candy provided us with authentication hooks allowing for API login, there is currently no login mechanism. Contributions are welcome

# Installation

Gemfile

    gem 'radiant-scoped-extension', :require => nil
    
config/environment.rb

    config.gem 'radiant-scoped-extension', :lib => false