class SelectVocab < ActiveRecord::Base
  attr_accessible :content_english, :select_id, :vocab_id
  belongs_to :select
  belongs_to :vocab
end
