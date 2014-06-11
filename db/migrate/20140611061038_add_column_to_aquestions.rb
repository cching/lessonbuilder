class AddColumnToAquestions < ActiveRecord::Migration
  def change
  	 add_column :aquestions, :level, :integer
  end
end
