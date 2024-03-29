class PostsController < ApplicationController
  load_and_authorize_resource only: [:dashBoard], find_by: :slug
  def index
    @posts = Post.all.where(author_id: params[:user_id])
    @user_search = User.find_by(id: params[:user_id])
  end

  def show
    @user_search = User.find_by(id: params[:user_id])
    # authorize! :read, @post
    @post = Post.find_by(id: params[:id])
  end

  def new
    @user = current_user
    @post = Post.new

    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.create!(params.require(:post)
      .permit(:title, :text)
      .merge(author_id: current_user.id))
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to user_path(params[:user_id])
  end
end
