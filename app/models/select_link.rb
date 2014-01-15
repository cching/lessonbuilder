class SelectLink < ActiveRecord::Base
  attr_accessible :comment, :link, :link_id, :select_id
  belongs_to :link
  belongs_to :select
end
