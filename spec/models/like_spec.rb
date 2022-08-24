require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @author = User.new(id: 1, name: 'Tom',
      photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      bio: 'Lorem ipsum dolor sit amet', email: 'some@example.com', password: 'password')
    @author.save
    @post = Post.new(author: @author, title: 'Post Title', text: 'Post Text', commentscounter: 0, likescounter: 0)
    @post.save
    @like = Like.new(author: @author, post: @post)
    @like.save
  end

  it 'should have a update_post_likes_counter method that increments the post\'s likes counter by 1' do
    expect(@post.likescounter).to eq(1)
    @like.update_post_likes_counter(:increment)
    expect(@post.likescounter).to eq(2)
  end
end
