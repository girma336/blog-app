class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all.where(author_id: params[:user_id], post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
