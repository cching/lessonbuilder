class SelectQuestion < ActiveRecord::Base
  attr_accessible :question_id, :select_id
  belongs_to :select
  belongs_to :question
end
