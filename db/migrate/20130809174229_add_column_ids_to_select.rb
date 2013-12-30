class AddColumnIdsToSelect < ActiveRecord::Migration
  def change
    add_column :selects, :subject_id, :integer
    add_column :selects, :date, :date
  end
end
