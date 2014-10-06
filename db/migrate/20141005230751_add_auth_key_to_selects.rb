class AddAuthKeyToSelects < ActiveRecord::Migration
  def up
  	add_column :selects, :auth_key, :string
  end
end
