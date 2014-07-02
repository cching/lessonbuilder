class Plan < ActiveRecord::Base
  attr_accessible :district_id, :initiate, :name, :select_id, :headers_attributes
  has_many :headers
  belongs_to :district
  accepts_nested_attributes_for :headers, allow_destroy: true
end

