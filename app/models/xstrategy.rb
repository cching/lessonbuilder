class Xstrategy < ActiveRecord::Base
  attr_accessible :content, :standard_id, :select_id
  belongs_to :standard
  has_many :select_links
end
