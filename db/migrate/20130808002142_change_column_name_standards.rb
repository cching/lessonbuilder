class ChangeColumnNameStandards < ActiveRecord::Migration
  def up
    rename_column :standards, :subsubjet_id, :subsubject_id
  end

  def down
  end
end
