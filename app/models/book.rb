class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids
  has_many :book_grades
  has_many :grades, through: :book_grades
end
