class GoogleForm < ActiveRecord::Base
  attr_accessible :resource_id, :select_id
  belongs_to :select
end
