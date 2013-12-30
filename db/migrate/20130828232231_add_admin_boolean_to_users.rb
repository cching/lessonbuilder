class AddAdminBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => FALSE
  end
end
