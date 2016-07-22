class Sock < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier
  has_many :images
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
