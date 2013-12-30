class CreateSelectStrategies < ActiveRecord::Migration
  def change
    create_table :select_strategies do |t|
      t.integer :select_id
      t.integer :strategy_id

      t.timestamps
    end
  end
end
