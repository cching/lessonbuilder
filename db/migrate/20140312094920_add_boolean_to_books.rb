class AddBooleanToBooks < ActiveRecord::Migration
  def change
  	 add_column :books, :pdf, :boolean, :default => FALSE
  end
end