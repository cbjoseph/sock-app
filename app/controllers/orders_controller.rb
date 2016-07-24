class OrdersController < ApplicationController
  def create
    sock = Sock.find_by(id: params[:sock_id])

    calculated_subtotal = sock.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total =  calculated_subtotal + calculated_tax
    

    order = Order.new(
      user_id: current_user.id,
      sock_id: params[:sock_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    order.save
    flash[:success] = "Order created!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
