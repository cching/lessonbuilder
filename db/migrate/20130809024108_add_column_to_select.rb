class AddColumnToSelect < ActiveRecord::Migration
  def change
    add_column :selects, :grade_id, :integer
    add_column :selects, :text_id, :integer
  end
end
