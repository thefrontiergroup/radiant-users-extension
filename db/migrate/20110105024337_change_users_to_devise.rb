# create_table "users", :force => true do |t|
#   t.string   "name",          :limit => 100
#   t.string   "email"
#   t.string   "login",         :limit => 40,  :default => "",    :null => false
#   t.string   "password",      :limit => 40
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "created_by_id"
#   t.integer  "updated_by_id"
#   t.boolean  "admin",                        :default => false, :null => false
#   t.boolean  "designer",                     :default => false, :null => false
#   t.text     "notes"
#   t.integer  "lock_version",                 :default => 0
#   t.string   "salt"
#   t.string   "session_token"
#   t.string   "locale"
# end

# devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :token_authenticatable

class ChangeUsersToDevise < ActiveRecord::Migration
  def self.up
    add_column :users, :encrypted_password,   :string, :null => false, :default => "", :limit => 128
    add_column :users, :password_salt,        :string, :null => false, :default => ""
    add_column :users, :username,             :string, :null => false, :default => "", :limit => 40
    
    add_column :users, :confirmation_token,   :string
    add_column :users, :confirmed_at,         :date_time
    add_column :users, :confirmation_sent_at, :date_time
    
    add_column :users, :reset_password_token, :string
    
    add_column :users, :remember_token,       :string
    add_column :users, :remember_created_at,  :date_time
    
    add_column :users, :authentication_token, :string
    
    User.reset_column_information
    puts "\n-- Migrating Users \n\n"
    User.find_each do |user|
      user[:username]           = user[:login]
      user[:encrypted_password] = user[:password]
      user[:password_salt]      = user[:salt]
      
      if user[:email].present?
        user[:email]  = user[:email]
      else
        puts "    WARNING: `#{user[:username]}` will need to set a real email address"
        user[:email]  = 'set@email.com'
      end
      
      user.confirm!
      user.save!
    end
    puts "\n\n"
    
    remove_column :users, :login
    remove_column :users, :password
    remove_column :users, :salt
    
  end
  
  def self.down
    
    add_column :users, :login,    :string, :limit => 40, :null => false, :default => ""
    add_column :users, :password, :string, :limit => 40
    add_column :users, :salt,     :string
    
    User.reset_column_information
    User.find_each do |user|
      user[:login]    = user[:username]
      user[:password] = user[:encrypted_password]
      user[:salt]     = user[:password_salt]
      
      user.save!
    end
    
    remove_column :users, :encrypted_password
    remove_column :users, :password_salt
    remove_column :users, :username
    
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    
    remove_column :users, :reset_password_token
    
    remove_column :users, :remember_token
    remove_column :users, :remember_created_at
    
    remove_column :users, :authentication_token
    
  end
end
