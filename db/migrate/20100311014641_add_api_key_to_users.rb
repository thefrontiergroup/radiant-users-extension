class AddApiKeyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :api_key, :string, :limit => 40, :default => ''
    
    User.all.each do |u|
      u.generate_api_key
      u.save
    end
  end

  def self.down
    remove_column :users, :api_key
  end
end
