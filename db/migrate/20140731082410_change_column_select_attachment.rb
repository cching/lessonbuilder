class ChangeColumnSelectAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :selects, :attachment
  end

  def self.down
    remove_attachment :selects, :attachment
  end
end
