class Text < ActiveRecord::Base
  attr_accessible :author, :grade_id, :subject, :title
  belongs_to :grade
  
end
