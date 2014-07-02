class CreateStandards < ActiveRecord::Migration
  def up
    create_table :standards do |t|
      t.string :id
      t.integer :subject_id
      t.integer :grade_id
      t.integer :subsubject_id
      t.string :subsubject
      t.text :content
    end
  end
end
