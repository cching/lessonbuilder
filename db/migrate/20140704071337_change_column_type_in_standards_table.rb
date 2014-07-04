class ChangeColumnTypeInStandardsTable < ActiveRecord::Migration
  def change
   change_column :standards, :successive_standard_id, :string
  end
end
