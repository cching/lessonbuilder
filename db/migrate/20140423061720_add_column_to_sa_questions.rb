class AddColumnToSaQuestions < ActiveRecord::Migration
  def change
  	 add_column :select_aquestions, :initiate, :boolean, :default => FALSE
  	 add_column :select_aquestions, :content, :text, :default => ""
  end
end

