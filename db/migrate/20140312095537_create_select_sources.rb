class CreateSelectSources < ActiveRecord::Migration
  def change
    create_table :select_sources do |t|
      t.integer :source_id
      t.integer :select_id

      t.timestamps
    end
  end
end
