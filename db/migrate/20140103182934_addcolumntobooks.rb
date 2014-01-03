class Addcolumntobooks < ActiveRecord::Migration
  def change
  	  	add_column :books, :example, :text
  end
end
