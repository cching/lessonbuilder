class CreateSelectSkills < ActiveRecord::Migration
  def change
    create_table :select_skills do |t|
      t.integer :skill_id
      t.integer :select_id

      t.timestamps
    end
  end
end
