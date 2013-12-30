class Addsubsubjectidtoselects < ActiveRecord::Migration
  def up
    add_column :selects, :subsubject_id, :integer
  end

  def down
  end
end
