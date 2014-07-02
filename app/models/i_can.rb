class ICan < ActiveRecord::Base
  attr_accessible :content, :standard_id
  belongs_to :standard
end
