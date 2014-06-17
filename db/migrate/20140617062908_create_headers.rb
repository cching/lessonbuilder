class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
