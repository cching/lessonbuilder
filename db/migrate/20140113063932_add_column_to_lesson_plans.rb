class AddColumnToLessonPlans < ActiveRecord::Migration
  def change
  	add_column :lessonplans, :name, :string
  end
end
