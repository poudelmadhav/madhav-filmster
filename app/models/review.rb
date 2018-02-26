class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, :comment, presence: true

  delegate :username, to: :user, prefix: true
  delegate :title, :tmdb_id, to: :movie, prefix: true

  # voting feature
  has_many :upvotes, dependent: :destroy
end
