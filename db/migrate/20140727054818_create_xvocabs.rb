class CreateXvocabs < ActiveRecord::Migration
  def change
    create_table :xvocabs do |t|
      t.string :content_english
      t.string :content_spanish
      t.timestamps
    end
  end
end
