class Book < ActiveRecord::Base
  attr_accessible :assess_questions, :author, :availability, :publisher, :title, :grade_ids, :example, :textcategory_id, :isbn, :image, :source_ids, :pdf
  has_attached_file :image,
                :storage => :s3,
                :bucket => 'commoncore',
                       :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      },
   :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, content_type: "application/pdf"
  has_many :book_grades, :dependent => :destroy
  has_many :grades, through: :book_grades
  belongs_to :textcategory
  has_many :selects
  has_many :booksources
  has_many :sources, through: :booksources

end
