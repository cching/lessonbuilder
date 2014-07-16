class CreateCaquestions < ActiveRecord::Migration
  def change
    create_table :caquestions do |t|
      t.integer :standard_id
      t.integer :select_id
      t.text :content

      t.timestamps
    end
  end
end
