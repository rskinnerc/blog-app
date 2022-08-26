class Api::CommentsController < ApplicationController
    def index
        @comments = Comment.where(post_id: params[:post_id])
        render json: @comments
    end
end