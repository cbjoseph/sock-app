class SocksController < ApplicationController
  def index
    sort_attribute = params[:sort]
    discount_item = params[:discount]
    @socks = Sock.all
    if params[:order] == "ascending" 
      @socks = Sock.order(sort_attribute)
    elsif params[:order] == "descending"
      @socks = Sock.order(sort_attribute => :desc) 
    elsif params[:search_terms]
      @socks = Sock.where("name LIKE ?", "%#{params[:search_terms]}%")
    elsif params[:category]
      current_category = Category.find_by(name: params[:category])
      @socks = current_category.socks
    end
    if params[:discount] == "true"
      @socks = Sock.where("price < ?", 7)
    end
    # if params[:sort] && params [:order]
    # @socks = Sock.order(params[:sort] ==> params[:order])
    # else @socks =Sock.all

    render 'index.html.erb'
  end

  def show
    if params[:id] == 'random'
      @sock = Sock.all.sample
    else 
      @sock = Sock.find_by(id: params['id'])
    end
    render 'show.html.erb'
  end

  def create
    @sock = Sock.new(
      name: params[:name], 
      size: params[:size], 
      price: params[:price], 
      description: params[:description],
      user: current_user.id
    )
    @sock.save
    @image = Image.new(
      url: params[:image_url],
      sock_id: @sock.id
    )
    @image.save
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
    flash[:danger] = "Sock <strong>successfully</strong> deleted!"
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
