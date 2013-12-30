class Clink < ActiveRecord::Base
  attr_accessible :comment, :link, :select_id, :standard_id
  belongs_to :standard
  belongs_to :select
end
