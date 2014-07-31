class ChangeLinkCOlumnType < ActiveRecord::Migration
  def up
  	change_column :xlinks, :standard_id, :string
  end

  def down
  end
end
