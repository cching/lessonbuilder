class CreateMathSubsubjects < ActiveRecord::Migration
  def change
    create_table :math_subsubjects do |t|
      t.string :name

    end
  end
end
