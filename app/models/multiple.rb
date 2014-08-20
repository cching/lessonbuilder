class Multiple < ActiveRecord::Base
  attr_accessible :assessment_id, :question, :answers_attributes, :standard_id
  belongs_to :standard
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :answers
end
