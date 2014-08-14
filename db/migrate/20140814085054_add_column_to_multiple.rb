class AddColumnToMultiple < ActiveRecord::Migration
  def change
  	add_column :multiples, :standard_id, :integer
  end
end
