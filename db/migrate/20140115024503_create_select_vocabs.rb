class CreateSelectVocabs < ActiveRecord::Migration
  def change
    create_table :select_vocabs do |t|
      t.integer :select_id
      t.integer :vocab_id
      t.string :content_english

      t.timestamps
    end
  end
end
