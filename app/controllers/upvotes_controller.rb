class UpvotesController < ApplicationController
	before_action :authenticate_user!

	def create
    @review = Review.find(params[:review_id])
    @upvote = Upvote.create(user: current_user,review: @review)
    @upvote.save!
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @upvote = Upvote.find_by(user: current_user, review: @review).destroy!
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

end
