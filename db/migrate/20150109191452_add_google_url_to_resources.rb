class AddGoogleUrlToResources < ActiveRecord::Migration
  def up
  	add_column :resources, :url, :string
  end
end
