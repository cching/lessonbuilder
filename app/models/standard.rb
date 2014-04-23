class Standard < ActiveRecord::Base
  attr_accessible :content, :grade_id, :subject_id, :subsubject, :subsubject_id
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
  
  has_many :cquestions
  has_many :cskills
  has_many :cvocabs
  has_many :cstrategies
  has_many :clinks
  has_many :aquestions
end

