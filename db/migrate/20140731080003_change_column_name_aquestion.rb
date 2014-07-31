class ChangeColumnNameAquestion < ActiveRecord::Migration
  def up
  	rename_column :select_aquestions, :aquestion_id, :xaquestion_id
  end

  def down
  end
end
