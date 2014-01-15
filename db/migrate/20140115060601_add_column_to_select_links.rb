class AddColumnToSelectLinks < ActiveRecord::Migration
  def change
  	add_column :select_links, :initiate, :boolean, :default => FALSE
  end
end
