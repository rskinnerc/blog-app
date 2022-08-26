class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    p current_user
    permitted = params.require(:comment).permit(:text)
    @comment = Comment.new(text: permitted[:text], author_id: current_user.id, post_id: params[:post_id])
    @comment.save

    render json: {status: 200, message: 'Comment created successfully.'}
  end
end
