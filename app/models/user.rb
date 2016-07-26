class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :socks
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :socks, through: :carted_products
end
