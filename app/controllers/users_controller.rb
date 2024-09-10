class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
		@user = User.find_by(id: params[:id])
		@posts = @user.posts 
	end

	def profiles
		@profiles = User.all 
	end
end
