class CreateSelectStandards < ActiveRecord::Migration
  def change
    create_table :select_standards do |t|
      t.integer :standard_id
      t.integer :user_id

      t.timestamps
    end
  end
end
