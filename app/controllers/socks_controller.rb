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
    render 'create.html.erb'
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
    render 'update.html.erb'
  end

  def new
    render 'new.html.erb'
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
