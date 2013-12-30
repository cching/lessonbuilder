class Skill < ActiveRecord::Base
  attr_accessible :content, :standard_id
  belongs_to :standard
  has_many :select_skills
end
