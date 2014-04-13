class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :content
      t.text :media
      t.text :title

      t.timestamps
    end
  end
end
