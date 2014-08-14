class ChangeUidStudents < ActiveRecord::Migration
  def up
  	change_column :students, :unique_identifier, :string
  end

  def down
  end
end
