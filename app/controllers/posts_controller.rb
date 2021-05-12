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

  def edit
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end

  def update
    # update the edit post so that can redirect to the previous show page
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render user_path(current_user), notice:'Your post was successfully created.'
    end
  end

  private

    def post_params
      params.require(:post).permit(:caption, :post_photo)
    end

end
