class AddColumnsToGoogleForm < ActiveRecord::Migration
  def up
  	add_column :google_forms, :spreadsheet_id, :string
  end
end
