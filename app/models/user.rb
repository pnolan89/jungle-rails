class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_length_of :password, minimum: 8
end
