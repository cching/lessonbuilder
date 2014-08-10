class ChangeColumnLessonsToSanitize < ActiveRecord::Migration
  def up
  	add_column :selects, :sanitize_notes, :text
  end

  def down
  end
end
