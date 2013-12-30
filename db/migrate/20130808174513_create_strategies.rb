class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.string :standard_id
      t.string :content
    end
  end
end
