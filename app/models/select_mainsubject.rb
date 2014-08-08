class SelectMainsubject < ActiveRecord::Base
  attr_accessible :select_id, :subject_id
  belongs_to :subject
  belongs_to :select
end
