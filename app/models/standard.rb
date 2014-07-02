class Standard < ActiveRecord::Base
  attr_accessible :content, :grade_id, :subject_id, :subsubject, :subsubject_id, :standard_id, :successive_standard_id, :standardid, :similar_standard_id, :questions_attributes, :strategies_attributes, :vocabs_attributes, :skills_attributes, :links_attributes, :aquestions_attributes, :anchor_standards_attributes, :i_cans_attributes
  belongs_to :subject
  belongs_to :subsubject
  belongs_to :grade
  has_many :selections
  has_many :selects, through: :selections
  has_many :questions
  has_many :select_questions, through: :questions
  has_many :skills
  has_many :select_skills, through: :skills
  has_many :strategies
  has_many :select_strategies, through: :strategies
  has_many :texts
  has_many :vocabs
  has_many :select_vocabs, through: :vocabs
  has_many :links
  has_many :select_links, through: :links
  has_many :aquestions
  has_many :select_aquestions, through: :aquestions
  has_many :anchor_standards
  has_many :i_cans

  
  has_many :cquestions
  has_many :cskills
  has_many :cvocabs
  has_many :cstrategies
  has_many :clinks
  has_many :aquestions

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :strategies, allow_destroy: true
  accepts_nested_attributes_for :vocabs, allow_destroy: true
  accepts_nested_attributes_for :aquestions, allow_destroy: true
  accepts_nested_attributes_for :links, allow_destroy: true
  accepts_nested_attributes_for :anchor_standards, allow_destroy: true
  accepts_nested_attributes_for :i_cans, allow_destroy: true

def to_param
  standardid  
end
end

