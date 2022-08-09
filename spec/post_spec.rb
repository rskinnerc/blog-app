require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @author = User.new(name: 'Ronald', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Dev.', postscount: 0)
    @author.save
    @post = Post.new(author: @author, title: 'Post Title', text: 'Post Text', commentscounter: 0)
    @post.save
  end

  it 'should have an author' do
    expect(@post.author).to eq(@author)
  end

  it 'should have a title' do
    expect(@post.title).to eq('Post Title')
  end

  it 'should have a text' do
    expect(@post.text).to eq('Post Text')
  end

  it 'should not be valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should not be valid with a title length greater than 250' do
    @post.title = 'x' * 251
    expect(@post).to_not be_valid
  end

  it 'should not be valid without a comments counter greater or equal to 0' do
    @post.commentscounter = -1
    expect(@post).to_not be_valid
  end

  it 'should not be valid without a likes counter greater or equal to 0' do
    @post.likescounter = -1
    expect(@post).to_not be_valid
  end
end