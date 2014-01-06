class SelectGrade < ActiveRecord::Base
  attr_accessible :grade_id, :select_id
  belongs_to :grade
  belongs_to :select
end
