class AddColumnToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :user_id, :integer, :default => 0
  	add_column :skills, :duplicate, :boolean, :default => FALSE
  end
end
