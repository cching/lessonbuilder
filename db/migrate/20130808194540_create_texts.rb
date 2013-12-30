class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :grade_id
      t.string :subject
      t.string :author
      t.string :title
    end
  end
end
