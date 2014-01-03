class BookGrade < ActiveRecord::Base
  attr_accessible :book_id, :grade_id
  belongs_to :grade
  belongs_to :book
end
