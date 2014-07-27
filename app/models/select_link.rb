class SelectLink < ActiveRecord::Base
  attr_accessible :comment, :link, :link_id, :select_id
  belongs_to :xlink
  belongs_to :select
end
