class CommentsController < ApplicationController



def new
@post = Post.find(params[:post_id])
@comment = Comment.new
end

def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to posts_path(@post)
    else
      flash[:notice] = "Something went wrong... Please try again! 👍"
      redirect_to posts_path(@post)
    end
end

def edit
end

def update
 @comment.update(comment_params)
 redirect_to comments_path(@comment)
end

# def destroy
# @comment.destroy
# redirect_to comments_path
# end

private

def comment_params
  params.require(:comment)
        .permit(:title, :body, :user_id, :post_id)
end

def set_post
  @post = Post.find(params[:post_id])
end

end
