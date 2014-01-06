class CreateSelectGrades < ActiveRecord::Migration
  def change
    create_table :select_grades do |t|
      t.integer :grade_id
      t.integer :select_id

      t.timestamps
    end
  end
end
