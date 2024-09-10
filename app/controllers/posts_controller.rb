class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:edit, :update]

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path(@user), notice: 'Post updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
