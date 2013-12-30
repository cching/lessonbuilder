class CreateSelects < ActiveRecord::Migration
  def change
    create_table :selects do |t|
      t.integer :user_id
      t.integer :standard_id

      t.timestamps
    end
  end
end
