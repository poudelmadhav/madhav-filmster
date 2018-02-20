class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user

	def create
		@user = User.find(params[:id])
		current_user.follow(@user)

		respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
	end

	def destroy
	  current_user.unfollow(@user)

	  respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
      end
	end

	private

	def check_user
		@user = User.find(params[:id])
		if @user.id == current_user.id
			flash[:alert] = "Woops! It seems there was an error."
			redirect_to current_user, format: 'js'
		end
	end
end
