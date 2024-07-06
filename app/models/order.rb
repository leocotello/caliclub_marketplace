class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  before_save :calculate_total_price

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true

  private

  def calculate_total_price
    self.total_price = product.price * quantity
  end
end
