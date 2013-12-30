class CreateVocabs < ActiveRecord::Migration
  def change
    create_table :vocabs do |t|
      t.string :standard_id
      t.string :content_english
      t.string :content_spanish
    end
  end
end
