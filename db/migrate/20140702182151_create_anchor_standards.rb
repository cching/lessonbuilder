class CreateAnchorStandards < ActiveRecord::Migration
  def change
    create_table :anchor_standards do |t|
      t.integer :standard_id
      t.integer :new_id
      t.string :amsubj_ord
      t.string :assubj_ord
      t.string :tsubject
      t.text :content

      t.timestamps
    end
  end
end
