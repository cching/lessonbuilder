class Xlink < ActiveRecord::Base
  attr_accessible :comment, :link, :standard_id, :select_id
  belongs_to :standard
  belongs_to :select
end
