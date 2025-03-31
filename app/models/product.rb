class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :stock_transactions, dependent: :destroy

  has_one_attached :image

  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, 'must be a JPEG, PNG, or GIF')
    end

    if image.byte_size > 5.megabytes
      errors.add(:image, 'is too big. Maximum size is 5MB')
    end
  end

  def total_stock
    stock_transactions.sum("CASE WHEN transaction_type = 'add' THEN quantity ELSE -quantity END") + stock
  end
end
