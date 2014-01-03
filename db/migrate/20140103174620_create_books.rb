class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.text :publisher
      t.string :title
      t.text :assess_questions
      t.text :availability

      t.timestamps
    end
  end
end
