class CreateTextcategories < ActiveRecord::Migration
  def change
    create_table :textcategories do |t|
      t.string :category
    end
  end
end
