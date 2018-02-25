json.reviews do
  json.array! @reviews.each do |review|
    json.id review.id
    json.user review.user
    json.movie review.movie
    json.comment review.comment
  end
end