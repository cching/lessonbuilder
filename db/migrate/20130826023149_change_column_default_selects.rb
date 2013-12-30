class ChangeColumnDefaultSelects < ActiveRecord::Migration
  def up
    change_column :selects, :grade_id, :integer, :default => 1
    change_column :selects, :subject_id, :integer, :default => 1
    change_column :selects, :subsubject_id, :integer, :default => 1
    change_column :selects, :name, :string, :default => ""
  end

  def down
  end
end
