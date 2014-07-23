class ChangeHeaderColumn < ActiveRecord::Migration
  def up
  	add_column :headers, :select_id, :integer
  	add_column :headers, :initiate, :boolean
  end

  def down
  	remove_column :headers, :select_id, :integer
  	remove_column :headers, :initiate, :boolean
  end
end
