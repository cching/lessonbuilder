class SelectStrategy < ActiveRecord::Base
  attr_accessible :content, :select_id, :strategy_id
    belongs_to :select
  belongs_to :xstrategy
end
