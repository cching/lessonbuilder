class CreateSelectSkills < ActiveRecord::Migration
  def change
    create_table :select_skills do |t|
      t.integer :select_id
      t.integer :skill_id
      t.string :content

      t.timestamps
    end
  end
end
