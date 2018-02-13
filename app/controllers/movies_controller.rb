class MoviesController < ApplicationController
	def index
		@movies = Movie.all.order('updated_at DESC').includes(reviews: :user).limit(20)
    	@reviews = Review.all.order('created_at DESC').includes(:user, :movie).limit(7)
	end

	def show
		@movie = Movie.find(params[:id])
	end
end
