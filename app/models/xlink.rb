class Xlink < ActiveRecord::Base
  attr_accessible :comment, :link, :standard_id, :select_id
  belongs_to :standard
  has_many :select_links
end
