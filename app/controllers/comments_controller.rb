class CommentsController < ApplicationController
before_action :set_comment, only: [:edit, :update, :destroy]

def new
@comment = Comment.new
end

def create
@comment = Comment.new(comment_params)
  @comment.user = current_user
  if @comment.save
    redirect_to comment_path(@comment)
  else
    render :new
  end
end

def edit
end

def update
 @comment.update(comment_params)
 redirect_to comments_path(@comment)
end

def destroy
@comment.destroy
redirect_to comments_path

private

def comment_params
  params.require(:comment)
        .permit(:title, :body, :user_id, :post_id)
end

def set_comment
  @comment = Comment.find(params[:id])
end

end
