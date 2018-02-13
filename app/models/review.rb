class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, :comment, presence: true

  delegate :username, to: :user, prefix: true
  delegate :title, :id, to: :movie, prefix: true
end
