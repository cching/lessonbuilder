class CreateLessonplans < ActiveRecord::Migration
  def change
    create_table :lessonplans do |t|
      t.text :content
      t.integer :select_id, :default => 0
      t.integer :district_id
      t.boolean :duplicate, :default => FALSE
      t.timestamps
    end
  end
end
