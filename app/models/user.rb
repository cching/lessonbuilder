class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :district_id
  has_secure_password
  has_many :selects, dependent: :destroy
  has_many :standards, through: :selects
  has_many :selections, through: :selects
  has_many :questions, :dependent => :destroy
  has_many :vocabs, :dependent => :destroy
  has_many :strategies, :dependent => :destroy
  has_many :links, :dependent => :destroy
  belongs_to :district


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end