class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

   # Associations
   has_many :products, dependent: :destroy
   has_many :categories, dependent: :destroy
end
