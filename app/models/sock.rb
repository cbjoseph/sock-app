class Sock < ActiveRecord::Base
  def friendly_created_at
    created_at.strftime('%b %d, %Y %l:%M %p')
    # strftime
  end 

  def discounted?
    price.to_f < 100.00
  end

  def tax
    @tax = price.to_f * 0.09
    @tax
  end

  def total
    price.to_f + @tax
  end
end
