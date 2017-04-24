class User < ApplicationRecord
  has_many :memes, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
