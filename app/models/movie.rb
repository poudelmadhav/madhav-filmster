class Movie < ApplicationRecord
	validates :title, :release_date, :released, :runtime, :popularity, :language, :budget, :average_vote, :vote_count, :tmdb_id, presence: true
	has_many :reviews
end
