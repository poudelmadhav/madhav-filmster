class UsersController < ApplicationController
	def show
	  @user = User.find(params[:id])
	end

	def timeline
		@reviews = Review.where(user: current_user.following_users).order("created_at DESC")
	end
end
