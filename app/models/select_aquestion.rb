class SelectAquestion < ActiveRecord::Base
  attr_accessible :aquestion_id, :select_id
  belongs_to :aquestion
  belongs_to :select
end
