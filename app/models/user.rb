class User < ActiveRecord::Base
  has_many :socks
  has_secure_password
end
