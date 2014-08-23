class CreateSelectTexts < ActiveRecord::Migration
  def change
    create_table :select_texts do |t|
      t.integer :select_id
      t.integer :book_id

      t.timestamps
    end
  end
end
