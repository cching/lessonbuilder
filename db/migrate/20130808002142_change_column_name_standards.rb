class ChangeColumnNameStandards < ActiveRecord::Migration
  def change
    create_table(:standards, :id => false) do |t|
      t.string :standard_id, :options => 'PRIMARY KEY'
      t.string :standard_id
      t.integer :subject_id
      t.integer :grade_id
      t.integer :subsubject_id
      t.string :subsubject
      t.text :content
    end
  end
end

