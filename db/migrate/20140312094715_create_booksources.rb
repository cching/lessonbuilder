class CreateBooksources < ActiveRecord::Migration
  def change
    create_table :booksources do |t|
      t.integer :book_id
      t.integer :source_id

      t.timestamps
    end
  end
end
