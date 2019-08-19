class Comment < ApplicationRecord
  validates :user_id, uniqueness: { scope: :movie_id, message: 'You can comment this movie only once' }
  belongs_to :movie
  belongs_to :user
end
