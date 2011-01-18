class User < ActiveRecord::Base; end

class ChangeAdminToAdministrator < ActiveRecord::Migration
  def self.up
    
    begin
      User.find_each do |user|
        user.update_attribute(:class_name, 'Administrator') if user.class_name == 'Admin'
      end
    rescue
      # You probably didn't need this then
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
