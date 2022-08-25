class Post < ApplicationRecord
  has_many :comments, -> { includes :author }, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentscounter, :likescounter, numericality: { greater_than_or_equal_to: 0 }

  after_create -> { update_author_posts_count(:increment) }
  after_destroy -> { update_author_posts_count(:decrement) }

  def update_author_posts_count(operation)
    if operation == :increment
      author.increment!(:postscount)
    else
      author.decrement!(:postscount)
    end
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def liked?(user)
    likes.where(author: user).any?
  end
end
