class Header < ActiveRecord::Base
  attr_accessible :content, :title, :plan_id
  belongs_to :plan
  belongs_to :select
end
