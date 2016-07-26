class Sock < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :socks, through: :carted_products

  def friendly_created_at
    created_at.strftime('%b %d, %Y %l:%M %p')
    # strftime
  end 

  def discounted?
    price < 100.00
  end

  def tax
    @tax = price * 0.09
    @tax
  end

  def total
    price + @tax
  end
  
end
