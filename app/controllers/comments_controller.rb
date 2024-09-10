class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.parent_id = params[:comment][:parent_id] if params[:comment][:parent_id].present?

    if @comment.save
      redirect_to user_post_path(current_user, @post), notice: 'Comment was successfully created.'
    else
      redirect_to user_post_path(current_user, @post), alert: 'Error creating comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
