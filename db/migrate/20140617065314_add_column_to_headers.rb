class AddColumnToHeaders < ActiveRecord::Migration
  def change
    add_column :headers, :plan_id, :integer
  end
end
