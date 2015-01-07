class AddNameColumnToAttachments < ActiveRecord::Migration
  def up
  	add_column :attachments, :name, :text
  end
end
