class User < ApplicationRecord
  before_save do
    self.email = email.downcase
  end
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Only valid email address" }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 3 }
end
