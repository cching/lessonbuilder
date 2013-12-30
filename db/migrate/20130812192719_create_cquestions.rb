class CreateCquestions < ActiveRecord::Migration
  def change
    create_table :cquestions do |t|
      t.integer :select_id
      t.string :content

      t.timestamps
    end
  end
end
