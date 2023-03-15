class PostsController < ApplicationController
  def index
    # @user = User.includes(:posts).find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @user_search = User.find(params[:user_id])
  end

  def show
    @user_search = User.find(params[:user_id])
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
  end
end
