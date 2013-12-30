class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :standard_id
      t.string :content

    end
  end
end
