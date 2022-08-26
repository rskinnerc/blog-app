class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    p current_user
    permitted = params.require(:comment).permit(:text)
    @comment = Comment.new(text: permitted[:text], author_id: 1, post_id: params[:post_id])
    @comment.save
  end
end
