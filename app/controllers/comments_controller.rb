class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to @comment.gist
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :gist_id)
  end

end