require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @author = User.new(id: 1, name: 'Tom',
                       photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                       bio: 'Lorem ipsum dolor sit amet', email: 'some@example.com', password: 'password')
    @author.save
    @post = Post.new(author: @author, title: 'Post Title', text: 'Post Text', commentscounter: 0, likescounter: 0)
    @post.save
    @comment = Comment.new(author: @author, text: 'Comment Text', post: @post)
    @comment.save
  end

  it 'should have a update_comments_counter method that increments the post\'s comment counter by 1' do
    expect(@post.commentscounter).to eq(1)
    @comment.update_comments_counter
    expect(@post.commentscounter).to eq(2)
  end
end
