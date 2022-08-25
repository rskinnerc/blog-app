class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_create -> { update_comments_counter(:increment) }
  after_destroy -> { update_comments_counter(:decrement) }

  def update_comments_counter(operation)
    if operation == :increment
      post.increment!(:commentscounter)
    else
      post.decrement!(:commentscounter)
    end
  end
end
