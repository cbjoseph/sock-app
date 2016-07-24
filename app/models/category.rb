class Category < ActiveRecord::Base
  has_many :categorized_products
  has_many :socks, through: :categorized_products
end
