class Answer < ActiveRecord::Base
  attr_accessible :answer, :correct, :multiple_id
  belongs_to :multiple
end
