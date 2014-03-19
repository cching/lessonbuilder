class Textcategory < ActiveRecord::Base
  attr_accessible :category, :subsubject_id
  has_many :books
  belongs_to :subject
  has_many :documents
end
