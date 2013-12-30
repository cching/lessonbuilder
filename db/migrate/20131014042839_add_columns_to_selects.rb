class AddColumnsToSelects < ActiveRecord::Migration
  def change
    add_column :selects, :description, :string, :default => ""
    add_column :selects, :objective, :string, :default => ""
    add_column :selects, :book, :string, :default => ""
      add_column :selects, :notes, :string, :default => ""
  end
end
