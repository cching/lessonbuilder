class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids, :example, :textcategory_id, :isbn
  has_many :book_grades, :dependent => :destroy
  has_many :grades, through: :book_grades
  belongs_to :textcategory
  has_many :selects
end
