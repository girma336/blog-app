class User < ApplicationRecord
  has_many :likes
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { only_inter: true, greater_than_or_equal_to: 0 }
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
