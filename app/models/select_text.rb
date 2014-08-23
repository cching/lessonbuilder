class SelectText < ActiveRecord::Base
  attr_accessible :select_id, :book_id
  belongs_to :select
  belongs_to :book
end
