class Vocab < ActiveRecord::Base
  attr_accessible :content_english, :content_spanish, :standard_id
  belongs_to :standard
  has_many :select_vocabs
  belongs_to :user
end
