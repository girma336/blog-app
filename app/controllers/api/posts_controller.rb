class Api::PostsController < ApplicationController
  def index
    @posts = Post.all.where(author_id: params.require(:user_id))
    respond_to do |format|
      format.json { render json: @posts }
    end
  end
end
