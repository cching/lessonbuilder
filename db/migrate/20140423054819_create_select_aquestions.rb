class CreateSelectAquestions < ActiveRecord::Migration
  def change
    create_table :select_aquestions do |t|
      t.integer :aquestion_id
      t.integer :select_id

      t.timestamps
    end
  end
end
