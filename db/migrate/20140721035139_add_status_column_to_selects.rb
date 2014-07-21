class AddStatusColumnToSelects < ActiveRecord::Migration
  def up
    add_column :selects, :status, :string
  end

  def down
    remove_column :selects, :status
  end
end
