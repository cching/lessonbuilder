class AddIndexToBook < ActiveRecord::Migration
  def up
  	add_index :books, :textcategory_id
  end
end
