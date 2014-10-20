class AddBodyToSelects < ActiveRecord::Migration
  def change
  	add_column :selects, :body, :text
  end
end
