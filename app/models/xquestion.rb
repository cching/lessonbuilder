class Xquestion < ActiveRecord::Base
  attr_accessible :content, :standard_id, :select_id, :bold, :highlight, :italic
  belongs_to :standard
  belongs_to :select
end
