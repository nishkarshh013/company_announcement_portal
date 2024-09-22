class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
		@user = User.find_by(id: params[:id])
		@posts = @user.posts 
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
	  @user = User.find(params[:id]) 

	  if @user.update(user_params)
	    @posts = @user.posts
	    redirect_to @user, notice: "User updated successfully!"
	  else
	    render :edit  # Re-render the edit form if update fails
	  end
	end

	def profiles
		@profiles = User.all 
	end

	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :image)
	end
end
