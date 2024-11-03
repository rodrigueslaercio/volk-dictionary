class User < ApplicationRecord
  has_secure_password
  has_many :favorite_words
  validates :name, presence: true, uniqueness: true
end
