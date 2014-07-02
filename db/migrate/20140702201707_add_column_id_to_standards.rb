class AddColumnIdToStandards < ActiveRecord::Migration
  def change
  	add_column :standards, :standard_id, :integer
  end
end
