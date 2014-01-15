class AddNewColumnToSelectStrategies < ActiveRecord::Migration
  def change
  	add_column :select_strategies, :initiates, :boolean, :default => FALSE
  end
end