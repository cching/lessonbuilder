class CreateICans < ActiveRecord::Migration
  def change
    create_table :i_cans do |t|
      t.integer :standard_id
      t.text :content

      t.timestamps
    end
  end
end
