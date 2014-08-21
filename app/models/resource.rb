class Resource < ActiveRecord::Base
  attr_accessible :content, :media, :title, :attachment, :rcategory_id
  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment
  belongs_to :rcategory
end
