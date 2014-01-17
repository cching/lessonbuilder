class AddFewColumnsToSelects < ActiveRecord::Migration
  def change
  	add_column :selects, :vocabulary, :text, :default => ""
  	add_column :selects, :writing, :text, :default => ""
  	add_column :selects, :conclusion, :text, :default => ""
  end
end