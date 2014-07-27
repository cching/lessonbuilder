class AddColumnToSelections < ActiveRecord::Migration
  def up
  	add_column :selections, :initiate, :boolean
  end

  def down
  	remove_column :selections, :intiiate, :boolean
  end
end
