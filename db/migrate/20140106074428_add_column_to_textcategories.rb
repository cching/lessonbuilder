class AddColumnToTextcategories < ActiveRecord::Migration
  def change
  	  	add_column :textcategories, :subsubject_id, :integer
  end
end
