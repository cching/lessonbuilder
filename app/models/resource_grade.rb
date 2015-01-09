class ResourceGrade < ActiveRecord::Base
  attr_accessible :grade_id, :resource_id
  belongs_to :grade
  belongs_to :resource
end
