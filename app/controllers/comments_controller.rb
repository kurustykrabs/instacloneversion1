class CommentsController < ApplicationController
  def create
    if params[:user_id]
      user = User.find(params[:user_id])
    end
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    if comment.save
      if user
        redirect_to user_path(user), notice: 'Comment success'
      else
        redirect_to post_path(post)
      end
    else
      if user
      redirect_to user_path(user), alert: 'There was an error.'
    else
      redirect_to post_path(post)
    end
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
