class AddSelectColumnToResources < ActiveRecord::Migration
  def up
  	add_column :xquestions, :select_id, :integer
  	add_column :xvocabs, :select_id, :integer
  	add_column :xstrategies, :select_id, :integer
  	add_column :xlinks, :select_id, :integer
  	add_column :xskills, :select_id, :integer
  end
end
