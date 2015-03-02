class CreateGoogleForms < ActiveRecord::Migration
  def change
    create_table :google_forms do |t|
      t.integer :select_id
      t.string :resource_id

      t.timestamps
    end
  end
end
