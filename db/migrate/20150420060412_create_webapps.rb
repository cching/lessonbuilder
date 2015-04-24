class CreateWebapps < ActiveRecord::Migration
  def change
    create_table :webapps do |t|
      t.string :url
      t.string :query_id

      t.timestamps
    end
  end
end
