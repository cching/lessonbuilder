class Xaquestion < ActiveRecord::Base
	acts_as_list
attr_accessible :content, :standard_id, :select_id
  belongs_to :standard
  belongs_to :select
end
