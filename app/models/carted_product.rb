class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :sock
  belongs_to :order
  validates :quantity, presence: true, numericality: {greater_than: 0, only_integer: true}
end
