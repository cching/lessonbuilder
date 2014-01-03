class Addcolumntobooks2 < ActiveRecord::Migration
  def change
  	  	add_column :books, :textcategory_id, :integer
  end
end
