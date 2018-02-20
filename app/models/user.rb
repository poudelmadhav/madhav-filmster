class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  validates_uniqueness_of :username
  mount_uploader :avatar, AvatarUploader

  has_many :reviews

  def reviewed?(movie)
    reviews.each do |review|
      return true if review.movie_id == movie.id
    end

    return false
  end
end
