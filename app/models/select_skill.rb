class SelectSkill < ActiveRecord::Base
  attr_accessible :select_id, :skill_id, :content
  belongs_to :select
  belongs_to :xskill
end
