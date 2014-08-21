class ChangeAttachmentColumnResources < ActiveRecord::Migration
def self.up
    add_attachment :resources, :attachment
  end

  def self.down
    remove_attachment :resources, :attachment
  end
end
