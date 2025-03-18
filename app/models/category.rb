class Category < ApplicationRecord
    belongs_to :user  # Each category belongs to a user
    has_many :products, dependent: :nullify 

    validates :name, presence: true
  end
  