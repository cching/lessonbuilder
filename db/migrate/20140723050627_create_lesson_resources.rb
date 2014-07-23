class CreateLessonResources < ActiveRecord::Migration
  def change
    create_table :lesson_resources do |t|
      t.integer :select_id
      t.text :book
      t.text :notes

      t.timestamps
    end
  end
end
