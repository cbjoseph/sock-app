class SocksController < ApplicationController
  def show_sock
    @socks = Sock.all
    render 'sock.html.erb'
  end

  def pineapple_sock
    @title = "Want to feel the Hawaiian Breeze?"
    @sock = Sock.first
    render 'one_sock.html.erb'
  end

  def pug_sock
    @title = "Who doesn't love wrinkles... on a dog?"
    @sock = Sock.second
    render 'one_sock.html.erb'
  end

  def sushi_sock
    @title = "California Roll? Spicy Tuna? I'll take 3!"
    @sock = Sock.last
    render 'one_sock.html.erb'
  end
end
