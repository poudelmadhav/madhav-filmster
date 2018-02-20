class Movie < ApplicationRecord
	validates :title, :release_date, :runtime, :popularity, :language, :budget, :average_vote, :vote_count, :tmdb_id, presence: true
	has_many :reviews, dependent: :destroy
end
