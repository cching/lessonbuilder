class Subsubject < ActiveRecord::Base
  attr_accessible :name
  has_many :standards
  has_many :select_subjects
  has_many :selects, through: :select_subjects
  has_many :textcategories
  has_many :books, through: :textcategories
end
