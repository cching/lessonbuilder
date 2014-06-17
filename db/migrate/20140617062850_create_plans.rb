class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :district_id
      t.integer :select_id
      t.boolean :initiate

      t.timestamps
    end
  end
end
