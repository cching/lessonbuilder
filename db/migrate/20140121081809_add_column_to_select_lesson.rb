class AddColumnToSelectLesson < ActiveRecord::Migration
  def change
  	 add_column :selects, :textdependent, :text, :default => ""
  end
end