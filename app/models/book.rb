class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids, :example, :textcategory_id, :isbn, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :book_grades, :dependent => :destroy
  has_many :grades, through: :book_grades
  belongs_to :textcategory
  has_many :selects
end
