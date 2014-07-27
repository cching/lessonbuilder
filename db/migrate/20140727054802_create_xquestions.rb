class CreateXquestions < ActiveRecord::Migration
  def change
    create_table :xquestions do |t|
      t.string :content
      t.timestamps
    end
  end
end
