class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :email
      t.string :school
      t.string :district
      t.text :notes

      t.timestamps
    end
  end
end
