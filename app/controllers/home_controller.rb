class HomeController < ApplicationController
  def index
    @authors = Author.all
    @posts = Post.all.order(created_at: :desc)
  end
end
