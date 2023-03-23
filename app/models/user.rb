class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { only_inter: true, greater_than_or_equal_to: 0 }
  def three_most_recent_posts
    Post.includes(:author).where(author_id: id).order(created_at: :desc).limit(3)
  end

  ROLES = %i[admin default].freeze

  def is?(role_name)
    role == role_name.to_s
  end
end
