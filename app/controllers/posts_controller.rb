class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    # @user=current_user
  end

  def create
    @new_post = current_user.posts.create(title: params[:post][:title], text: params[:post][:text], author_id: params[:user_id])
    if @new_post.save
      redirect_to user_posts_path(current_user),  notice: "Post created successfully"
    else
      render :new, alert: "Post not created"
    end  
  end
end
