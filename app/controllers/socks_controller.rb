class SocksController < ApplicationController
  def index
    @socks = Sock.all
    render 'index.html.erb'
  end

  def show
    @sock = Sock.find_by(id: params['id'])
    render 'show.html.erb'
  end

  def create
    @sock = Sock.new(
      name: params[:name], 
      size: params[:size], 
      price: params[:price], 
      description: params[:description], 
      image: params[:image]
    )
    @sock.save
    flash[:success] = "Sock successfully created!"
    redirect_to "/socks/#{@sock.id}"
  end

  def edit
    @sock = Sock.find_by(id: params['id'])
    render 'edit.html.erb'
  end

  def update
    @sock = Sock.find_by(id: params['id'])
    @sock.update(
      name: params[:name],
      size: params[:size],
      price: params[:price],
      description: params[:description],
      image: params[:image]
    )
    flash[:success] = "Sock successfully updated!"
    redirect_to "/socks/#{@sock.id}"
  end

  def new
    render 'new.html.erb'
  end
  
  def destroy
    @sock = Sock.find_by(id: params['id'])
    @sock.destroy
    flash[:success] = "Sock successfully deleted!"
    redirect_to '/socks'
  end
end
#   def pineapple_sock
#     @title = "Want to feel the Hawaiian Breeze?"
#     @sock = Sock.first
#     render 'one_sock.html.erb'
#   end

#   def pug_sock
#     @title = "Who doesn't love wrinkles... on a dog?"
#     @sock = Sock.second
#     render 'one_sock.html.erb'
#   end

#   def sushi_sock
#     @title = "California Roll? Spicy Tuna? I'll take 3!"
#     @sock = Sock.last
#     render 'one_sock.html.erb'
#   end
# end
