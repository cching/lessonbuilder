class CreateSelectQuestions < ActiveRecord::Migration
  def change
    create_table :select_questions do |t|
      t.integer :select_id
      t.integer :question_id

      t.timestamps
    end
  end
end
