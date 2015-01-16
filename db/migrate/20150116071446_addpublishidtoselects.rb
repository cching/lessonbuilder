class Addpublishidtoselects < ActiveRecord::Migration
  def up
  	add_column :selects, :publish_id, :string
  end

  def down
  end
end
