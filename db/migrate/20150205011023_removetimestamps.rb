class Removetimestamps < ActiveRecord::Migration
  def change
  	remove_column :item_forms, :created_at
  	remove_column :item_forms, :updated_at
  end
end
