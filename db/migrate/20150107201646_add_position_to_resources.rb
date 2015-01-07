class AddPositionToResources < ActiveRecord::Migration
  def change
    add_column :xlinks, :position, :integer
    add_column :xvocabs, :position, :integer
    add_column :xaquestions, :position, :integer
  end
end
