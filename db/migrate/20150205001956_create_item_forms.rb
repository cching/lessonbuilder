class CreateItemForms < ActiveRecord::Migration
  def change
    create_table :item_forms do |t|
      t.integer :item_id
      t.integer :form_id
      t.integer :quantity

      t.timestamps
    end
  end
end
