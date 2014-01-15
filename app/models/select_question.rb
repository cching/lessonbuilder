class SelectQuestion < ActiveRecord::Base
  attr_accessible :content, :question_id, :select_id
    belongs_to :select
  	belongs_to :question
end
