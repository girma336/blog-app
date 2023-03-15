class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_search = User.find_by(id: params[:id])
    @post = Post.where(author_id: params[:id])
  end
end
