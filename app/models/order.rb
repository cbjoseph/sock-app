class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :sock
  has_many :carted_products
  has_many :socks, through: :carted_products

def subtotal_order
  @carted_products = CartedProduct.where(status: "purchased", order_id: id)
  subtotal_all = 0
  @carted_products.each do |carted_product|
    subtotal_all = subtotal_all + carted_product.sock.price
  end
  return subtotal_all
end

def order_tax
  subtotal_order * 0.09
end

def total_order
  total_order = subtotal_order + order_tax
end

end