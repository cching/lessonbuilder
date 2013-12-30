class Selection < ActiveRecord::Base
  attr_accessible :select_id, :standard_id
  belongs_to :select
  belongs_to :standard
  has_many :questions, through: :standard
end
