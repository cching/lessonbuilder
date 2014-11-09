class AddBigIdeaColToSelects < ActiveRecord::Migration
  def up
  	add_column :selects, :big_idea, :text
  	change_column :selects, :description, :text
  end

  def down
  end
end
