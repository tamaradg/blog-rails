class PostsController < ApplicationController

def index
  @posts = Post.all
end

def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)
  @post.user = current_user
  if @post.save
    redirect_to post_path(@post)
  else
  render :new
  end
end

# def edit
#   @post = Post.find(params[:id])
# end

# def update
#   @post.update(posts_params)
# end



private

def post_params
  params.require(:post)
        .permit(:title, :body, :user_id)
end

end
