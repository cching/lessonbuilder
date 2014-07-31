class SelectAquestion < ActiveRecord::Base
  attr_accessible :aquestion_id, :select_id
  belongs_to :select, :dependent => :destroy
  belongs_to :xaquestion, :dependent => :destroy
  validates_uniqueness_of :xaquestion_id, scope: [:select_id]
end
