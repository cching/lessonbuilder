class Header < ActiveRecord::Base
  default_value_for :initiate do
    false
  end
  
  attr_accessible :content, :title, :plan_id, :select_id, :initiate
  belongs_to :plan
  belongs_to :select
end
