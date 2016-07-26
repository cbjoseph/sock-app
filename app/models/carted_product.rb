class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :sock
  belongs_to :order
end
