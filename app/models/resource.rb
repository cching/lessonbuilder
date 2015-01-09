class Resource < ActiveRecord::Base
  attr_accessible :content, :media, :title, :attachment, :rcategory_id, :filetype_id, :grade_ids, :google_url, :file
  belongs_to :rcategory
  has_many :resource_grades
  has_many :grades, through: :resource_grades
  mount_uploader :file, FileUploader

  validates_presence_of :title, :grade_ids, :filetype_id, :rcategory_id

  has_many :attachment_resources
  has_many :attachments, through: :attachment_resources
end
