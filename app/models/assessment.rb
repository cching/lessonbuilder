class Assessment < ActiveRecord::Base
  attr_accessible :select_id, :title, :multiples_attributes, :shorts_attributes
  belongs_to :select
  has_many :multiples
  has_many :shorts

  accepts_nested_attributes_for :multiples
  accepts_nested_attributes_for :shorts
end
