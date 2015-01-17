class Select < ActiveRecord::Base

  #default value to prevent nil object
  default_value_for :date do
    Date.today
  end


  has_attached_file :attachment
  has_many :attachments
  do_not_validate_attachment_file_type :attachment
  #Selects is the lesson model but is named 'select' for the ActiveRecord join association
  attr_accessible :user_id, :standard_ids, :textdependent, :name, :grade_ids, :text_id, :date, :vocabulary, :writing, :conclusion, :objective, :notes, :description, :book, :subject_id, :subsubject_ids, :private, :xquestion_ids, :xvocab_ids, :select_ids, :xstrategy_ids, :xskill_ids, :xvocab_ids, :xlink_ids, :book_id, :cvocabs_attributes, :lesson_resources_attributes, :cskills_attributes, :cstrategies_attributes, :clinks_attributes, :caquestions_attributes, :source_ids, :aquestion_ids, :headers_attributes, :starts_at, :ends_at, :status, :xquestions_attributes, :xvocabs_attributes, :xlinks_attributes, :xstrategies_attributes, :xskills_attributes, :xaquestions_attributes, :attachment, :subject_ids, :sanitize_notes, :book_ids, :body, :big_idea, :user_ids, :publish_id
  belongs_to :user
  
  has_many :mailers
#selections made by the user for lessons  
  has_many :selections, :dependent => :destroy
  has_many :standards, through: :selections
  
  has_many :select_questions, :dependent => :destroy
  has_many :xquestions
  
  has_many :select_skills, :dependent => :destroy
  has_many :xskills
  
  has_many :select_strategies, :dependent => :destroy
  has_many :xstrategies
  
  has_many :select_vocabs, :dependent => :destroy
  has_many :xvocabs

  has_many :select_texts, :dependent => :destroy
  has_many :books, through: :select_texts
  
  has_many :select_aquestions, :dependent => :destroy
  has_many :xaquestions

  has_many :select_links, :dependent => :destroy
  has_many :xlinks

  has_many :select_subjects, :dependent => :destroy
  has_many :subsubjects, through: :select_subjects

  has_many :select_mainsubjects, :dependent => :destroy
  has_many :subjects, through: :select_mainsubjects

  has_many :select_grades, :dependent => :destroy
  has_many :grades, through: :select_grades
  has_many :lessonplans
  belongs_to :book
  belongs_to :document

  has_many :assessments

  has_many :select_sources, :dependent => :destroy
  has_many :sources, through: :select_sources
  has_many :headers, :dependent => :destroy
  accepts_nested_attributes_for :headers, allow_destroy: true
  has_many :lesson_resources, :dependent => :destroy
  accepts_nested_attributes_for :lesson_resources, allow_destroy: true

#custom user input fields

  accepts_nested_attributes_for :select_questions, allow_destroy: true
  accepts_nested_attributes_for :xquestions
  accepts_nested_attributes_for :xskills
  accepts_nested_attributes_for :xstrategies
  accepts_nested_attributes_for :xvocabs
  accepts_nested_attributes_for :xlinks
  has_many :select_users, :dependent => :destroy
  has_many :users, through: :select_users
  accepts_nested_attributes_for :xaquestions
    scope :between, lambda {|start_time, end_time|
    {:conditions => [
  "starts_at > ? and starts_at < ?",
  Select.format_date(start_time), Select.format_date(end_time)
] }
  }

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :description => self.description || "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :url => Rails.application.routes.url_helpers.select_path(id),
      #:color => "red"
    }

  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  attr_reader :user_tokens

  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end


  validates :name, :grades, :sources, :subjects, :presence => true, :if => :active_or_setup?
  def active?
    status == 'active'
  end

  def active_or_setup?
    (status || '').include?('setup') || active?
  end

  def active_or_text?
    (status || '').include?('text') || active?
  end

  def active_or_standards?
    (status || '').include?('standards') || active?
  end

  def active_or_standard_resources?
    (status || '').include?('standard_resources') || active?
  end

  def active_or_note_resources?
    (status || '').include?('note_resources') || active?
  end

end

