class AddColumnsToLessons < ActiveRecord::Migration
  def change
  	 add_column :selects, :starts_at, :datetime
  	 add_column :selects, :ends_at, :datetime
  end
end
