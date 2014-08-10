class AddPositionToXquestions < ActiveRecord::Migration
  def change
    add_column :xquestions, :position, :integer
  end
end
