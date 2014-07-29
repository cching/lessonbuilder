class Xvocab < ActiveRecord::Base
  attr_accessible :content_english, :content_spanish, :standard_id, :select_id
  belongs_to :standard
  has_many :select_vocabs
end
