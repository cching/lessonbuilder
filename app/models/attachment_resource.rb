class AttachmentResource < ActiveRecord::Base
  attr_accessible :attachment_id, :resource_id
  belongs_to :resource
  belongs_to :attachment
end
