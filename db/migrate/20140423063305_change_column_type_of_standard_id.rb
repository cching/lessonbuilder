class ChangeColumnTypeOfStandardId < ActiveRecord::Migration
  def up
   change_column :aquestions, :standard_id, :string
  end

  def down
   change_column :aquestions, :standard_id, :integer
  end
end
