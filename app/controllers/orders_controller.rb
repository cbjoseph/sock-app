class OrdersController < ApplicationController
  def create
    sock = Sock.find_by(id: params[:sock_id])
    cartedproducts = CartedProduct.where(status: "carted", user_id: current_user.id)
  
    @order = Order.new(
      user_id: current_user.id
    )
    @order.save
    cartedproducts.each do |cartedproduct|
      cartedproduct.update(order_id: @order.id)
      cartedproduct.update(status: "purchased")
    end
    @order.subtotal = @order.subtotal_order
    @order.tax = @order.order_tax
    @order.total = @order.total_order
    @order.save

    flash[:success] = "Order created!"
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @purchased = Order.all
    render 'show.html.erb'
  end
end
