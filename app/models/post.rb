class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :increment_user_post_counter
  after_destroy :decrement_user_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end

  private

  def increment_user_post_counter
    author.increment!(:posts_counter)
  end

  def decrement_user_post_counter
    author.decrement!(:posts_counter)
  end
end
