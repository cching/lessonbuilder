class AddColumnsToXfiles < ActiveRecord::Migration
  def up
  	add_column :xquestions, :standard_id, :string
  	add_column :xvocabs, :standard_id, :string
  	add_column :xskills, :standard_id, :string
  	add_column :xstrategies, :standard_id, :strings
  end
end
