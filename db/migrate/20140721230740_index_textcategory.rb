class IndexTextcategory < ActiveRecord::Migration
  def up
  	add_index :book_grades, [:book_id, :grade_id]
  	add_index :booksources, [:source_id, :book_id]
  end

  def down
  end
end
