class PostsController < ApplicationController
before_action :set_post, only: [:edit, :update]

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

def edit

end

def update
  @post.update(post_params)
  redirect_to posts_path(@post)
end



private

def post_params
  params.require(:post)
        .permit(:title, :body, :user_id)
end

def set_post
  @post = Post.find(params[:id])
end

end
