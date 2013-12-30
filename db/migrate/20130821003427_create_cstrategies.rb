class CreateCstrategies < ActiveRecord::Migration
  def change
    create_table :cstrategies do |t|
      t.integer :select_id
      t.string :standard_id
      t.string :content

      t.timestamps
    end
  end
end
