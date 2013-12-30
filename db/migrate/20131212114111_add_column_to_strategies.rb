class AddColumnToStrategies < ActiveRecord::Migration
  def change
  	  	add_column :strategies, :user_id, :integer, :default => 0
  	add_column :strategies, :duplicate, :boolean, :default => FALSE
  end
end
