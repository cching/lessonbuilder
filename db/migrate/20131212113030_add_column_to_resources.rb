class AddColumnToResources < ActiveRecord::Migration
  def change
  	add_column :links, :user_id, :integer, :default => 0
  	add_column :links, :duplicate, :boolean, :default => FALSE
  end
end
