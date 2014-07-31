class SelectLink < ActiveRecord::Base
  attr_accessible :comment, :link, :link_id, :select_id
  belongs_to :xlink
  belongs_to :select
  validates_uniqueness_of :xlink_id, scope: [:select_id]
end
