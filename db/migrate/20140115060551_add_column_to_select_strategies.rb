class AddColumnToSelectStrategies < ActiveRecord::Migration
  def change
  	add_column :select_strategies, :initiate, :boolean, :default => FALSE
  end
end
