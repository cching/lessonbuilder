class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :standard_id
      t.string :content
    end
  end
end
