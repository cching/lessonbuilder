class SelectSource < ActiveRecord::Base
  attr_accessible :select_id, :source_id
  belongs_to :select
  belongs_to :source
end
