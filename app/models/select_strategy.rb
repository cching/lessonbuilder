class SelectStrategy < ActiveRecord::Base
  attr_accessible :content, :select_id, :strategy_id
  belongs_to :select, :dependent => :destroy
  belongs_to :xstrategy, :dependent => :destroy
  validates_uniqueness_of :xstrategy_id, scope: [:select_id]
end
