class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :district_id
  has_many :selects, dependent: :destroy
  has_many :standards, through: :selects
  has_many :selections, through: :selects
  has_many :questions, :dependent => :destroy
  has_many :vocabs, :dependent => :destroy
  has_many :strategies, :dependent => :destroy
  has_many :links, :dependent => :destroy
  belongs_to :district
  has_many :students

  has_many :select_users, :dependent => :destroy
  has_many :selects, through: :select_users
end