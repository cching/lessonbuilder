class AddColumnToSelectQuestions < ActiveRecord::Migration
  def change
  	add_column :select_questions, :initiate, :boolean, :default => FALSE
  end
end
