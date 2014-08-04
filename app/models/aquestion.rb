class Aquestion < ActiveRecord::Base
  attr_accessible :content, :standard_id, :level
  belongs_to :standard
  has_many :select_aquestions
  belongs_to :user
end
