class AddColumnToResources2 < ActiveRecord::Migration
  def up
  	add_column :resources, :rcategory_id, :integer
  end
end
