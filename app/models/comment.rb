class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create -> { update_author_posts_count(:increment) }
  after_destroy -> { update_author_posts_count(:decrement) }

  def update_author_posts_count(operation)
    if operation == :increment
      post.increment!(:commentscounter)
    else
      post.decrement!(:commentscounter)
    end
  end
end
