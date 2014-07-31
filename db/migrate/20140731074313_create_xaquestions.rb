class CreateXaquestions < ActiveRecord::Migration
  def change
    create_table :xaquestions do |t|
    	t.string :content
    	t.string :standard_id
    	t.integer :select_id
      t.timestamps
    end
  end
end
