class Xlink < ActiveRecord::Base
	acts_as_list
  attr_accessible :comment, :link, :standard_id, :select_id
  belongs_to :standard
  belongs_to :select
end
