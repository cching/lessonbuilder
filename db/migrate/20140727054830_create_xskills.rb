class CreateXskills < ActiveRecord::Migration
  def change
    create_table :xskills do |t|
      t.text :content
      t.timestamps
    end
  end
end
