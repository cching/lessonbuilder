class SelectVocab < ActiveRecord::Base
  attr_accessible :select_id, :vocab_id
  belongs_to :select
  belongs_to :vocab
end
