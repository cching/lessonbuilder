class AddFileToResources < ActiveRecord::Migration
  def change
    add_column :resources, :file, :string
  end
end
