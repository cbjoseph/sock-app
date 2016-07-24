class User < ActiveRecord::Base
  has_many :socks
  has_secure_password
  has_many :orders
end
