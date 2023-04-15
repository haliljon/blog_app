class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
    end

    def create
        @comment= Comment.new(author_id:  current_user.id, post_id: params[:post_id], text: params[:comment][:text])
        if @comment.save
            redirect_to user_post_path(current_user, @comment.post),  notice: "Comment created!"
        else
            render :new,  alert: "Comment not created!"
        end
    end
end
