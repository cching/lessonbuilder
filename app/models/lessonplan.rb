class Lessonplan < ActiveRecord::Base
  attr_accessible :district_id, :select_id, :content, :name, :writing, :conclusion, :questions
  belongs_to :select
  belongs_to :district
end
