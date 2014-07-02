class AnchorStandard < ActiveRecord::Base
  attr_accessible :amsubj_ord, :assubj_ord, :content, :new_id, :standard_id, :tsubject
  belongs_to :standard
end
