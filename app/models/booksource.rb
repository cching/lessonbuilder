class Booksource < ActiveRecord::Base
  attr_accessible :book_id, :source_id
  belongs_to :book
  belongs_to :source
end
