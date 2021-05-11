class PostsController < ApplicationController

  def index
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render user_path(current_user), notice:'Your post was successfully created.'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user), notice:'Your post has been deleted.'
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  # end

  private

    def post_params
      params.require(:post).permit(:caption, :post_photo)
    end

end
