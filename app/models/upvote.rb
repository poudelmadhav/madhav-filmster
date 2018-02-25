class Upvote < ApplicationRecord
	validates :user, :review, presence: true
	validates :user_id, uniqueness: {scope: :review_id}

	belongs_to :user
	belongs_to :review
end
