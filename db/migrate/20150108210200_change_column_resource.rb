class ChangeColumnResource < ActiveRecord::Migration
  def up
  	add_column :resources, :filetype_id, :integer
  end

  def down
  	remove_column :resources, :filetype_id, :integer
  end
end
