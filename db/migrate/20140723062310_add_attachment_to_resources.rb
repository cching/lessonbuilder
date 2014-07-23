class AddAttachmentToResources < ActiveRecord::Migration
  def self.up
    add_attachment :lesson_resources, :attachment
  end

  def self.down
    remove_attachment :lesson_resources, :attachment
  end
end
