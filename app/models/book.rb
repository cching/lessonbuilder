class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids, :example, :textcategory_id, :isbn, :image, :source_ids, :pdf, :comments
  

  has_attached_file :image, :styles => { :medium => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["application/pdf","application/vnd.ms-excel",     
             "image/jpeg",
             "image/gif", 
             "image/jpg", 
             "image/png"]
  has_many :book_grades, :dependent => :destroy
  has_many :grades, through: :book_grades
  belongs_to :textcategory
  has_many :select_texts
  has_many :selects, through: :select_texts
  has_many :booksources
  has_many :sources, through: :booksources


end
