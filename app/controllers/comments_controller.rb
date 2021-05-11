class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    if comment.save
      redirect_to post_path(post), notice: 'Comment success'
    else
      redirect_to post_path(post), alert: 'There was an error.'
    end
  end

  private

  def comment_params
    params.require(:comment), permit (:content)
  end

end
