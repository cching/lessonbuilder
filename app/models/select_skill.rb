class SelectSkill < ActiveRecord::Base
  attr_accessible :select_id, :skill_id, :content
  belongs_to :select, :dependent => :destroy
  belongs_to :xskill, :dependent => :destroy
  validates_uniqueness_of :xskill_id, scope: [:select_id]
end
