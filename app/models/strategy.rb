class Strategy < ActiveRecord::Base
  attr_accessible :content, :standard_id
  belongs_to :standard
  has_many :select_strategies
  belongs_to :user
end
