class Source < ActiveRecord::Base
  attr_accessible :name
  has_many :booksources
  has_many :books, through: :booksources

  has_many :select_sources
  has_many :selects, through: :select_sources

  has_many :documentsources
  has_many :documents, through: :documentsources
end
