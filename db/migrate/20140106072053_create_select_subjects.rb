class CreateSelectSubjects < ActiveRecord::Migration
  def change
    create_table :select_subjects do |t|
      t.integer :select_id
      t.integer :subsubject_id

      t.timestamps
    end
  end
end
