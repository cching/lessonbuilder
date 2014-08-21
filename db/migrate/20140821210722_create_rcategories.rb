class CreateRcategories < ActiveRecord::Migration
  def change
    create_table :rcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
