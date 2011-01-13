# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radiant-users-extension}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dirk Kelly"]
  s.date = %q{2011-01-13}
  s.description = %q{Makes Radiant better by adding users!}
  s.email = ["dk@dirkkelly.com"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitignore",
    "MIT-LICENCE",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/helpers/admin/users_helper.rb",
    "app/models/admin.rb",
    "app/models/designer.rb",
    "app/models/user.rb",
    "app/models/visitor.rb",
    "app/views/admin/users/_fields.html.haml",
    "app/views/admin/users/_form.html.haml",
    "app/views/confirmations/new.html.haml",
    "app/views/devise_mailer/confirmation_instructions.html.haml",
    "app/views/devise_mailer/reset_password_instructions.html.haml",
    "app/views/devise_mailer/unlock_instructions.html.haml",
    "app/views/mailer/confirmation_instructions.html.haml",
    "app/views/mailer/reset_password_instructions.html.haml",
    "app/views/mailer/unlock_instructions.html.haml",
    "app/views/passwords/edit.html.haml",
    "app/views/passwords/new.html.haml",
    "app/views/registrations/edit.html.haml",
    "app/views/registrations/new.html.haml",
    "app/views/sessions/new.html.haml",
    "app/views/shared/_links.html.haml",
    "app/views/shared/_version.html.haml",
    "app/views/unlocks/new.html.haml",
    "config/initializers/devise.rb",
    "config/initializers/radiant_config.rb",
    "config/initializers/radiant_devise_encryptor.rb",
    "config/locales/devise.en.yml",
    "config/locales/en.yml",
    "config/routes.rb",
    "cucumber.yml",
    "db/migrate/20100311014641_add_api_key_to_users.rb",
    "db/migrate/20100311021835_add_access_to_user.rb",
    "db/migrate/20110105024337_change_users_to_devise.rb",
    "db/migrate/20110105150917_add_class_name_field.rb",
    "db/migrate/20110107032850_move_permissions_to_class.rb",
    "features/support/env.rb",
    "features/support/paths.rb",
    "lib/login_system.rb",
    "lib/radiant-users-extension.rb",
    "lib/radiant-users-extension/version.rb",
    "lib/tasks/users_extension_tasks.rake",
    "lib/users/controllers/admin/resource_controller.rb",
    "lib/users/controllers/admin/welcome_controller.rb",
    "lib/users/controllers/application_controller.rb",
    "lib/users/controllers/single_form_body_styles.rb",
    "lib/users/controllers/site_controller.rb",
    "lib/users/lib/devise/controllers/internal_helpers.rb",
    "lib/users/lib/login_system.rb",
    "lib/users/models/user.rb",
    "lib/users/models/user/scoped.rb",
    "lib/users/tags/core.rb",
    "lib/users/tags/helper.rb",
    "lib/users/tags/helpers.rb",
    "radiant-users-extension.gemspec",
    "spec/datasets/devise_users_dataset.rb",
    "spec/datasets/scoped_users_dataset.rb",
    "spec/models/user_spec.rb",
    "spec/models/visitor_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/tags/core_spec.rb",
    "users_extension.rb"
  ]
  s.homepage = %q{http://github.com/dirkkelly/radiant-users-extension}
  s.post_install_message = %q{
    Add this to your radiant project with:
      config.gem 'radiant-users-extension', :version => '2.0.0'
    }
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.1}
  s.summary = %q{Users for Radiant CMS}
  s.test_files = [
    "features/support/env.rb",
    "features/support/paths.rb",
    "spec/datasets/devise_users_dataset.rb",
    "spec/datasets/scoped_users_dataset.rb",
    "spec/models/user_spec.rb",
    "spec/models/visitor_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/tags/core_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, ["~> 0.9"])
      s.add_runtime_dependency(%q<devise>, ["~> 1.0.9"])
    else
      s.add_dependency(%q<radiant>, ["~> 0.9"])
      s.add_dependency(%q<devise>, ["~> 1.0.9"])
    end
  else
    s.add_dependency(%q<radiant>, ["~> 0.9"])
    s.add_dependency(%q<devise>, ["~> 1.0.9"])
  end
end

