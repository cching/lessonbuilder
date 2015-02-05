class ItemForm < ActiveRecord::Base
  attr_accessible :form_id, :item_id, :quantity
  belongs_to :item
	belongs_to :form
end
