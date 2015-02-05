class Form < ActiveRecord::Base
  attr_accessible :district, :email, :name, :notes, :school, :item_forms_attributes
  has_many :item_forms, :dependent => :destroy 
	has_many :items, through: :item_forms
	accepts_nested_attributes_for :item_forms, :allow_destroy => true
end
