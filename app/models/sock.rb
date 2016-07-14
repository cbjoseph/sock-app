class Sock < ActiveRecord::Base
  def friendly_created_at
    created_at.strftime('%b %d, %Y %l:%M %p')
    # strftime
  end 

  def sale_message
    if price.to_i < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    @tax = price.to_i * 0.09
    @tax
  end

  def total
    price.to_i + @tax
  end
end
