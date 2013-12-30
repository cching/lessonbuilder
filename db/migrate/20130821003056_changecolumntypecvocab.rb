class Changecolumntypecvocab < ActiveRecord::Migration
  def up
      change_column :cvocabs, :standard_id, :string
  end

  def down
  end
end
