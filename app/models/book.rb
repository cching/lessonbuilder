class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids, :example
  has_many :book_grades
  has_many :grades, through: :book_grades
  belongs_to :textcategory
end
