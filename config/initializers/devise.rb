Devise.setup do |config|
  
  config.mailer_sender       = "please-change-me@config-initializers-devise.com"
  config.use_default_scope   = true
  config.default_scope       = :user
  config.scoped_views        = true
    
  config.encryptor           = :radiant
  
  config.authentication_keys = [:login]
  
end