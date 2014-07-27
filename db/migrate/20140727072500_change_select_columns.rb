class ChangeSelectColumns < ActiveRecord::Migration
  def up
  	rename_column :select_questions, :question_id, :xquestion_id
  	rename_column :select_links, :link_id, :xlink_id
  	rename_column :select_strategies, :strategy_id, :xstrategy_id
  	rename_column :select_vocabs, :vocab_id, :xvocab_id
  	rename_column :select_skills, :skill_id, :xskill_id
  end

  def down
  end
end
