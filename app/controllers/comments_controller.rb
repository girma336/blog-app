class CommentsController < ApplicationController
  def index
    @comments = Comment.find_by(params[:id])
  end
end
