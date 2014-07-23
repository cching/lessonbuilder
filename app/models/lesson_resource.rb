class LessonResource < ActiveRecord::Base
  attr_accessible :book, :notes, :select_id, :attachment
  belongs_to :select
  has_attached_file :attachment
end
