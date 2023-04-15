class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    if @like.save
      redirect_to user_posts_path(current_user)
      flash[:success] = 'Like added'
    else
      flash[:error] = 'Something went wrong'
    end
  end
end
