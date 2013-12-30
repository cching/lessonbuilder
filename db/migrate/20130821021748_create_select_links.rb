class CreateSelectLinks < ActiveRecord::Migration
  def change
    create_table :select_links do |t|
      t.integer :select_id
      t.integer :link_id

      t.timestamps
    end
  end
end
