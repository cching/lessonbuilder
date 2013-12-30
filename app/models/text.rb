class Text < ActiveRecord::Base
  attr_accessible :author, :grade_id, :subject, :title
  belongs_to :grade
  has_many :selects
end
