class AddBooleanToQuestion < ActiveRecord::Migration
  def change
  	  	add_column :questions, :duplicate, :boolean, :default => FALSE
  end
end
