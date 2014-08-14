class ChangeAnswerColumn < ActiveRecord::Migration
  def up
  	rename_column :answers, :question_id, :multiple_id
  end

  def down
  end
end
