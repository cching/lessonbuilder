class Attachment < ActiveRecord::Base
  attr_accessible :file_type, :select_id, :file
  belongs_to :select

  mount_uploader :file, FileUploader
  
end
