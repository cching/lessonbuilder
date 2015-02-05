class Changedefaultquantityvalue < ActiveRecord::Migration
  def change
  	change_column :item_forms, :quantity, :integer, :default => 0
  end

end
