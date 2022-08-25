class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @comment = Comment.new
  end
  
  def destroy
     @comment = Comment.find(params[:id]) 
     if can? :delete, @comment
      @comment.destroy
      redirect_to user_post_path(params[:user_id], params[:post_id])
    end
  end

  def create
    permitted = params.require(:comment).permit(:text)
    @comment = Comment.new(text: permitted[:text], author_id: current_user.id, post_id: params[:post_id])
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
    end
  end
end
