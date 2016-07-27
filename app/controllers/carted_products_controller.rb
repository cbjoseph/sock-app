class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cartedproducts = CartedProduct.all.where(user_id: current_user.id, status: "carted")
    render 'index.html.erb'
  end

  def create
    @sock = Sock.find_by(id: params[:sock_id])
    @cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      sock_id: params[:sock_id],
      quantity: params[:quantity],
      status: "carted"
      )
    @cartedproduct.save
    redirect_to "/carted_products"
  end

  def destroy
    @cartedproduct = CartedProduct.find_by(id: params[:id])
    @cartedproduct.update(status: "removed")
    redirect_to "/carted_products"
  end
end
