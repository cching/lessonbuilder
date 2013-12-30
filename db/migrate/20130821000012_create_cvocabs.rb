class CreateCvocabs < ActiveRecord::Migration
  def change
    create_table :cvocabs do |t|
      t.integer :select_id
      t.integer :standard_id
      t.string :content

      t.timestamps
    end
  end
end
