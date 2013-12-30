class AddColumnNameToSelect < ActiveRecord::Migration
  def change
    add_column :selects, :name, :string
  end
end
