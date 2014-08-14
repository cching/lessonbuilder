class CreateMultiples < ActiveRecord::Migration
  def change
    create_table :multiples do |t|
      t.text :question
      t.integer :assessment_id

      t.timestamps
    end
  end
end
