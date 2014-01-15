class CreateSelectLinks < ActiveRecord::Migration
  def change
    create_table :select_links do |t|
      t.integer :select_id
      t.integer :link_id
      t.text :comment
      t.text :link

      t.timestamps
    end
  end
end
