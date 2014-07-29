class AddTextColumnsToXquestions < ActiveRecord::Migration
  def up
  	add_column :xquestions, :bold, :boolean, :default => false
  	add_column :xquestions, :highlight, :boolean, :default => false
  	add_column :xquestions, :italic, :boolean, :default => false
  end
end
