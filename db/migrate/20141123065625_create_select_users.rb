class CreateSelectUsers < ActiveRecord::Migration
  def change
    create_table :select_users do |t|
      t.integer :select_id
      t.integer :user_id

      t.timestamps
    end
  end
end
