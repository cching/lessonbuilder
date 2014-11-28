class SelectUser < ActiveRecord::Base
  attr_accessible :select_id, :user_id
  belongs_to :select
  belongs_to :user
end
