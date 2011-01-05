class AddClassNameField < ActiveRecord::Migration
  def self.up
    add_column :users, :class_name, :string, :allow_blank => true
  end

  def self.down
    remove_column :users, :class_name
  end
end
