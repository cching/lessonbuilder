class AddMultipleColumnsToStandards < ActiveRecord::Migration
  def change
  	 add_column :standards, :successive_standard_id, :integer
  	 add_column :standards, :similar_standard_id, :integer
  	 add_column :standards, :standardid, :integer
  end
end
