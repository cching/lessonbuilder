class Student < ActiveRecord::Base
  before_create :create_unique_identifier, :create_default_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :unique_identifer, :name
  # attr_accessible :title, :body
  belongs_to :user

  def create_unique_identifier
  begin
    self.unique_identifier = SecureRandom.hex(5) # or whatever you chose like UUID tools
  end while self.class.exists?(:unique_identifier => unique_identifier)
  end

  def create_default_email
  begin
    self.email = SecureRandom.hex(5) # or whatever you chose like UUID tools
  end while self.class.exists?(:email => email)
  end
end
