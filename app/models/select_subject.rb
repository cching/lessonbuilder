class SelectSubject < ActiveRecord::Base
  attr_accessible :select_id, :subject_id
  belongs_to :subsubject
  belongs_to :select
end
