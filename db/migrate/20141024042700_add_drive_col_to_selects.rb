class AddDriveColToSelects < ActiveRecord::Migration
  def change
  	add_column :selects, :drive, :boolean, default: false
  end
end
