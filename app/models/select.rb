class Select < ActiveRecord::Base
  #default value to prevent nil object
    default_value_for :date do
    Date.today
  end

  #Selects is the lesson model but is named 'select' for the ActiveRecord join association
  attr_accessible :user_id, :standard_ids, :textdependent, :name, :grade_ids, :text_id, :date, :vocabulary, :writing, :conclusion, :objective, :notes, :description, :book, :subject_id, :subsubject_ids, :private, :question_ids, :select_ids, :strategy_ids, :skill_ids, :vocab_ids, :link_ids, :book_id, :cquestions_attributes, :cvocabs_attributes, :cskills_attributes, :cstrategies_attributes, :clinks_attributes, :source_ids, :aquestion_ids, :headers_attributes
  belongs_to :user
  belongs_to :subject
  
#selections made by the user for lessons  
  has_many :selections, :dependent => :destroy
  has_many :standards, through: :selections
  
  has_many :select_questions, :dependent => :destroy
  has_many :questions, through: :select_questions
  
  has_many :select_skills, :dependent => :destroy
  has_many :skills, through: :select_skills
  
  has_many :select_strategies, :dependent => :destroy
  has_many :strategies, through: :select_strategies
  
  has_many :select_vocabs, :dependent => :destroy
  has_many :vocabs, through: :select_vocabs
  
  has_many :select_aquestions, :dependent => :destroy
  has_many :aquestions, through: :select_aquestions

  has_many :select_links, :dependent => :destroy
  has_many :links, through: :select_links

  has_many :select_subjects, :dependent => :destroy
  has_many :subsubjects, through: :select_subjects

  has_many :select_grades, :dependent => :destroy
  has_many :grades, through: :select_grades
  has_many :lessonplans
  belongs_to :book
  belongs_to :document

  has_many :select_sources
  has_many :sources, through: :select_sources
  validates_presence_of :name, :description, :objective, :grades, :sources

  has_many :headers
  accepts_nested_attributes_for :headers, allow_destroy: true


#custom user input fields
  has_many :cquestions, :dependent => :destroy
  has_many :cskills, :dependent => :destroy
  has_many :cvocabs, :dependent => :destroy
  has_many :cstrategies, :dependent => :destroy
  has_many :clinks, :dependent => :destroy
  accepts_nested_attributes_for :cquestions, allow_destroy: true
  accepts_nested_attributes_for :cvocabs, allow_destroy: true
  accepts_nested_attributes_for :cskills, allow_destroy: true
  accepts_nested_attributes_for :cstrategies, allow_destroy: true
  accepts_nested_attributes_for :clinks, allow_destroy: true


end

