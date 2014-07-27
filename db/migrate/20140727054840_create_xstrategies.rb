class CreateXstrategies < ActiveRecord::Migration
  def change
    create_table :xstrategies do |t|
      t.text :content
      t.timestamps
    end
  end
end
