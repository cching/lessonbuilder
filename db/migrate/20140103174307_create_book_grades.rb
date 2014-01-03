class CreateBookGrades < ActiveRecord::Migration
  def change
    create_table :book_grades do |t|
      t.integer :grade_id
      t.integer :book_id

      t.timestamps
    end
  end
end
