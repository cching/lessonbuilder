class ChangeColumnNameAttachment < ActiveRecord::Migration
  def change
  	change_column :attachments, :file_url, :text
  	rename_column :attachments, :file_url, :google_url
  end
end
