class AddQuestionColumnToSelect < ActiveRecord::Migration
  def change
  	 add_column :selects, :questions, :text, :default => ""
  end
end
