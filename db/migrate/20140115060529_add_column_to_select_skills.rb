class AddColumnToSelectSkills < ActiveRecord::Migration
  def change
  	add_column :select_skills, :initiate, :boolean, :default => FALSE
  end
end
