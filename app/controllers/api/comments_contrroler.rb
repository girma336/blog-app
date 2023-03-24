class Api::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    redirect_to do |format|
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      format.json do
        if @comment.save
          render json: @comment, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
