class Attachment < ActiveRecord::Base
  attr_accessible :file_type, :select_id, :file, :name, :resource_ids, :google_url
  belongs_to :select

  mount_uploader :file, FileUploader
  
  has_many :attachment_resources
  has_many :resources, through: :attachment_resources
end

