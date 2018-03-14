json.reviews do
  json.array! @reviews.each do |review|
    json.id review.id
    json.user review.user
    json.movie review.movie
    json.comment review.comment
    json.review_created_at distance_of_time_in_words(DateTime.now, review.created_at)
  end
end