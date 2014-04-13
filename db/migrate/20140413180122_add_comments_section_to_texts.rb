class AddCommentsSectionToTexts < ActiveRecord::Migration
  def change
  	 add_column :books, :comments, :text, :default => ""
  end
end
