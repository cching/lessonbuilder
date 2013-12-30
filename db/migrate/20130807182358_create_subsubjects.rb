class CreateSubsubjects < ActiveRecord::Migration
  def change
    create_table :subsubjects do |t|
      t.string :name
    end
  end
end
