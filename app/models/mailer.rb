class Mailer < ActiveRecord::Base
  attr_accessible :email, :select_id
  belongs_to :select
end
