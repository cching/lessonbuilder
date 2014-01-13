class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :district_id, :integer, :default => 1
  end
end
