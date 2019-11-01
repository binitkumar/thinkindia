class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.new(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to comment.post, notice: "Comment added successfully"
    else
      redirect_to comment.post, notice: "Comment added successfully"
    end
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content, :user_id)
  end
end
