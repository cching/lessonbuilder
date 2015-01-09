class Grade < ActiveRecord::Base
  attr_accessible :number
  has_many :standards
  has_many :texts
  has_many :selects
  has_many :books
  has_many :book_grades
  has_many :books, through: :book_grades

  has_many :select_grades
  has_many :selects, through: :select_grades

  has_many :document_grades
  has_many :documents, through: :document_grades

  has_many :resource_grades
  has_many :resources, through: :resource_grades
end
