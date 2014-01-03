class Textcategory < ActiveRecord::Base
  attr_accessible :category
  has_many :books
end
