class AddTextColumnToSelects < ActiveRecord::Migration
  def change
  	  	add_column :selects, :book_id, :integer
  end
end
