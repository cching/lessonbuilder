class Documentsource < ActiveRecord::Base
  attr_accessible :document_id, :source_id
  belongs_to :source
  belongs_to :document
end
