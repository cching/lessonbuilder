class Grade < ActiveRecord::Base
  attr_accessible :number
  has_many :standards
  has_many :texts
  has_many :selects
  #The grade.id does not equal the grade number for the sake of ordering the grades in collection_select menus
  #Grade.id = Grade_number + 1
end
