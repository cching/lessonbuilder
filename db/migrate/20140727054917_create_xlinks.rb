class CreateXlinks < ActiveRecord::Migration
  def change
    create_table :xlinks do |t|
      t.text :comment
      t.text :link
      t.string :standard_id
      t.timestamps
    end
  end
end
