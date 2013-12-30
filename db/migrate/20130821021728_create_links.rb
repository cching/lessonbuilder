class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :standard_id
      t.text :comment
      t.text :link
    end
  end
end
