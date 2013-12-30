class AddBooleanColumnToSelects < ActiveRecord::Migration
  def change
    add_column :selects, :private, :boolean, :default => false
  end
end
