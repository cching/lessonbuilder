class Cvocab < ActiveRecord::Base
  attr_accessible :content, :select_id, :standard_id
  belongs_to :standard
  belongs_to :select
end
