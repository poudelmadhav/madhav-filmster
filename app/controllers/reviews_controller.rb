class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @movies = Movie.all.order('updated_at DESC').includes(reviews: :user).limit(20)
    @recent_reviews = Review.recent
  end

  def create
    @movie = MovieBuilder.new(tmdb_id: params[:tmdb_id]).build!

    # create a new review and connect it to the current_user and the movie
    @review = current_user.reviews.new(review_params.merge(movie_id: @movie.id))

    if @review.save
      flash[:success] = "Review saved!"
      redirect_to movies_path(@movie.tmdb_id)
    else
      flash[:alert] = "Woops! It seems there was an error."
      redirect_to root_path
    end

  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end