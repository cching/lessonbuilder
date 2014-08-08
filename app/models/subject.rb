class Subject < ActiveRecord::Base
  attr_accessible :name
  has_many :standards
  has_many :textcategories


  has_many :select_mainsubjects, :dependent => :destroy
  has_many :selects, through: :select_mainsubjects
end
