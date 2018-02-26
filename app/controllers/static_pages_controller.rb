class StaticPagesController < ApplicationController
	def index
		@movies = Tmdb::Movie.top_rated
    	@movies.results.each { |movie| MovieBuilder.new(tmdb_id: movie.id).build!}
    	@reviews = Review.all.order('created_at DESC').includes(:user, :movie).limit(7)
	end
	
	def timeline
	end
end
