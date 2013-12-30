class AddColumnToVocab < ActiveRecord::Migration
  def change
  	add_column :vocabs, :user_id, :integer, :default => 0
  	add_column :vocabs, :duplicate, :boolean, :default => FALSE
  end
end
