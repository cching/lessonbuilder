class Question < ActiveRecord::Base
  attr_accessible :content, :standard_id
  belongs_to :standard
  has_many :select_questions
  belongs_to :user
end
