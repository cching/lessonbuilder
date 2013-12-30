class AddColumnStandardIdToCquestions < ActiveRecord::Migration
  def change
    add_column :cquestions, :standard_id, :string
  end
end
