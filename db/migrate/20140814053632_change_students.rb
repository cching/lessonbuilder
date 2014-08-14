class ChangeStudents < ActiveRecord::Migration
  def up
  	add_column :students, :user_id, :integer
  end

  def down
  	remove_column :students, :user_id, :integer
  end
end
