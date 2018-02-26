class MoviesController < ApplicationController
	def show
		@movie = Movie.find_by(tmdb_id: params[:tmdb_id])
	end
end
