class ChangeColumns < ActiveRecord::Migration
  def up
  	add_column :select_users, :check, :boolean, :default => false
  end

  def down
  end
end
