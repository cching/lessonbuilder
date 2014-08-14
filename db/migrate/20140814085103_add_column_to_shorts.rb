class AddColumnToShorts < ActiveRecord::Migration
  def change
  	add_column :shorts, :standard_id, :integer
  end
end
