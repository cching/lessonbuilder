class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :select_id
      t.string :title

      t.timestamps
    end
  end
end
