class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :selections, :standard_id, :standard_number
  end

  def down
  end
end
