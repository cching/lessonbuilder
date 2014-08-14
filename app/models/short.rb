class Short < ActiveRecord::Base
  attr_accessible :assessment_id, :question, :standard_id
  belongs_to :standard
  belongs_to :assessment
end
