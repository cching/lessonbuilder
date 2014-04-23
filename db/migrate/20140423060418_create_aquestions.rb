class CreateAquestions < ActiveRecord::Migration
  def change
    create_table :aquestions do |t|
      t.text :content
      t.integer :standard_id

      t.timestamps
    end
  end
end
