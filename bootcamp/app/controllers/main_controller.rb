class MainController < ApplicationController
  def index
    # load all resources
    @posts = Post.all
    @navbars = Navbar.all
    @products = Product.all
  end
end