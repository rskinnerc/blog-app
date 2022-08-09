class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_post_likes_counter
    post.likescounter.nil? ? post.update(likescounter: 1) : post.update(likescounter: post.likescounter + 1)
  end
end
