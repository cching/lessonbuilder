class AddColumnToSelectVocabs < ActiveRecord::Migration
  def change
  	add_column :select_vocabs, :initiate, :boolean, :default => FALSE
  end
end
