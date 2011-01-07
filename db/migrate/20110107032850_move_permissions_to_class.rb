class User < ActiveRecord::Base; end

class MovePermissionsToClass < ActiveRecord::Migration
  def self.up
    User.find_each do |u|
      class_name = "User"
      class_name = "Designer" if u.designer == true
      class_name = "Admin"    if u.admin == true
      
      u.update_attribute(:class_name, class_name)
    end
    
    remove_column :users, :admin
    remove_column :users, :designer
  end

  def self.down
    create_column :users, :admin,    :boolean
    create_column :users, :designer, :boolean
    User.find_each do |u|
      u.designer = true if u.has_role?(:designer)
      u.admin = true    if u.has_role?(:admin)
    end
  end
end
