class AddQuestionColumnToLessonplan < ActiveRecord::Migration
  def change
  	 add_column :lessonplans, :questions, :text, :default => ""
  end
end
