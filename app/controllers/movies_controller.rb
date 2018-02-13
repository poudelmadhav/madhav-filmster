class MoviesController < ApplicationController
	def index
		@movies = Movie.all.order('updated_at DESC').includes(reviews: :user)
	end

	def show
		@movie = Movie.find(params[:id])
	end
end
