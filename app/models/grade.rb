class Grade < ActiveRecord::Base
  attr_accessible :number
  has_many :standards
  has_many :texts
  has_many :selects
  has_many :books
  #The grade.id does not equal the grade number for the sake of ordering the grades in collection_select menus
  #Grade.id = Grade_number + 1
  has_many :book_grades
  has_many :grades, through: :book_grades
end
