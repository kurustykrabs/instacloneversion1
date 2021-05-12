class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    if comment.save
      redirect_to user_path(user), notice: 'Comment success'
    else
      redirect_to user_path(user), alert: 'There was an error.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
