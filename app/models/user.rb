class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :rebuttals
  has_many :votes
  has_many :confrontations
end
