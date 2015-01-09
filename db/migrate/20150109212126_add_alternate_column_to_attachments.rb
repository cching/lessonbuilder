class AddAlternateColumnToAttachments < ActiveRecord::Migration
  def up
  	add_column :attachments, :alternate, :boolean, :default => FALSE
  end
end
