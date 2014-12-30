class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :select_id
      t.string :file_type

      t.timestamps
    end
  end
end
