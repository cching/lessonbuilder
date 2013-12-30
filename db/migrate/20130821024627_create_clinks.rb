class CreateClinks < ActiveRecord::Migration
  def change
    create_table :clinks do |t|
      t.integer :select_id
      t.string :standard_id
      t.string :comment
      t.string :link

      t.timestamps
    end
  end
end
