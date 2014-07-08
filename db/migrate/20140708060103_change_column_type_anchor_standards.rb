class ChangeColumnTypeAnchorStandards < ActiveRecord::Migration
  def change
   change_column :anchor_standards, :standard_id, :string
  end
end
