class Cquestion < ActiveRecord::Base
  attr_accessible :content, :select_id, :standard_id
  belongs_to :select
  belongs_to :standard
end
