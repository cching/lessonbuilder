class Xstrategy < ActiveRecord::Base
  attr_accessible :content, :standard_id, :select_id
  belongs_to :standard
  belongs_to :select
end
