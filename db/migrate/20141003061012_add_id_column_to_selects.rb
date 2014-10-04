class AddIdColumnToSelects < ActiveRecord::Migration
  def up
  	add_column :selects, :resource_id, :string
  end
end
