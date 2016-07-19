class ImagesController < ApplicationController
  def create
    @image = Image.new(
      url: params[:url],
      sock_id: params[:sock_id] 
    )
    @image.save
    redirect_to "/socks/#{@image.sock_id}"
  end
end
