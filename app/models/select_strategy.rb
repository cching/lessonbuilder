class SelectStrategy < ActiveRecord::Base
  attr_accessible :select_id, :strategy_id
  belongs_to :select
  belongs_to :strategy
end
