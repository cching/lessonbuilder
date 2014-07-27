class Xquestion < ActiveRecord::Base
  attr_accessible :content, :standard_id
  belongs_to :standard
  has_many :select_questions
  has_many :selects, through: :select_questions
end
