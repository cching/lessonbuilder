class CreateSelectMainsubjects < ActiveRecord::Migration
  def change
    create_table :select_mainsubjects do |t|
      t.integer :subject_id
      t.integer :select_id

      t.timestamps
    end
  end
end
