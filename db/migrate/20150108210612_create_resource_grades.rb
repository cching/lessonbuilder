class CreateResourceGrades < ActiveRecord::Migration
  def change
    create_table :resource_grades do |t|
      t.integer :resource_id
      t.integer :grade_id

      t.timestamps
    end
  end
end
