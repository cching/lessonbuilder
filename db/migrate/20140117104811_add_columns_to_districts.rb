class AddColumnsToDistricts < ActiveRecord::Migration
  def change
  	 add_column :lessonplans, :writing, :text, :default => ""
  	add_column :lessonplans, :conclusion, :text, :default => ""
  end
end
