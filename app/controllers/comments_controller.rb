class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.try(:id)
    @comment.save

    redirect_to @comment.gist
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :gist_id)
  end

end