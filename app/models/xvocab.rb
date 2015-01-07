class Xvocab < ActiveRecord::Base
	acts_as_list
  attr_accessible :content_english, :content_spanish, :standard_id, :select_id
  belongs_to :standard
  belongs_to :select
end
