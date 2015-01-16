class CreateMailers < ActiveRecord::Migration
  def change
    create_table :mailers do |t|
      t.integer :select_id
      t.string :email

      t.timestamps
    end
  end
end
