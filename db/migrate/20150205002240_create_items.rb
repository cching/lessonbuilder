class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :notes
      t.decimal :price
      t.string :item_id
      t.boolean :per_page

    end
  end
end
