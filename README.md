# Filmster

This in a online movie review portal. You can write your reviews by searching your desired movie. We have used the api of [TheMovieDb](https://www.themoviedb.org/) for the movie database.

This is live at:
https://madhav-filmster.herokuapp.com


# Docker build

### Build image
docker build -t madhav-filmster .

### Set required environment variables
export SECRET_KEY_BASE="$(rails secret)"
export DATABASE_URL="postgresql://postgres:password@localhost:5432/filmster_development"
export TMDB_API_KEY="TMDB_API_KEY"

### Run container
docker run --rm -it -p 3000:3000 --name=filmster-container \
  -e DATABASE_URL=$DATABASE_URL \
  -e SECRET_KEY_BASE=$RAILS_SECRET_KEY \
  -e TMDB_API_KEY=$TMDB_API_KEY \
  madhav-filmster
