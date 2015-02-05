class Item < ActiveRecord::Base
  attr_accessible :item_id, :name, :notes, :per_page, :price
  has_many :item_forms
	has_many :forms, through: :item_forms
end
