class WelcomeController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(params[:per])
  end
end
