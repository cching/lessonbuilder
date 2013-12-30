class CreateCskills < ActiveRecord::Migration
  def change
    create_table :cskills do |t|
      t.integer :select_id
      t.integer :standard_id
      t.string :content

      t.timestamps
    end
  end
end
