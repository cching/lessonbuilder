class CreateAttachmentResources < ActiveRecord::Migration
  def change
    create_table :attachment_resources do |t|
      t.integer :attachment_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
