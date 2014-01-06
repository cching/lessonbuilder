class Subject < ActiveRecord::Base
  attr_accessible :name
  has_many :standards
  has_many :textcategories
  has_many :selects
end
