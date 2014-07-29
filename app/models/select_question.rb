class SelectQuestion < ActiveRecord::Base
  attr_accessible :content, :xquestion_id, :select_id
  belongs_to :select, :dependent => :destroy
  belongs_to :xquestion, :dependent => :destroy
  validates_uniqueness_of :xquestion_id, scope: [:select_id]
end