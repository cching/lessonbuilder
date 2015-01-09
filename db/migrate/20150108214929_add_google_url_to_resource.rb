class AddGoogleUrlToResource < ActiveRecord::Migration
  def up
  	add_column :resources, :google_url, :text
  end
end
