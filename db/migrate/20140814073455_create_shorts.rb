class CreateShorts < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
      t.text :question
      t.integer :assessment_id

      t.timestamps
    end
  end
end
