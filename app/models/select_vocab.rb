class SelectVocab < ActiveRecord::Base
  attr_accessible :content_english, :select_id, :vocab_id
  belongs_to :select, :dependent => :destroy
  belongs_to :xvocab, :dependent => :destroy
  validates_uniqueness_of :xvocab_id, scope: [:select_id]
end
