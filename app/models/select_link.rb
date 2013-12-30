class SelectLink < ActiveRecord::Base
  attr_accessible :link_id, :select_id
  belongs_to :select
  belongs_to :link
end
