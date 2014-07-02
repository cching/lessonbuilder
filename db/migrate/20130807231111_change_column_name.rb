class ChangeColumnName < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :standard_id
      t.integer :select_id

      t.timestamps
    end
  end
end
