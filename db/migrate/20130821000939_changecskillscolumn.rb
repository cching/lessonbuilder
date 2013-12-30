class Changecskillscolumn < ActiveRecord::Migration
  def up
    change_column :cskills, :standard_id, :string
  end

  def down
  end
end
