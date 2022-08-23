require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @user = User.create(id: 1, name: 'Tom',
                        photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        bio: 'Lorem ipsum dolor sit amet', postscount: 0)
    @post = Post.create(author: @user, title: 'Post 1', text: 'This is the post body', commentscounter: 0,
                        likescounter: 0)
    Comment.create(post: @post, author: @user,
                   text: 'Comment 1 for Post 1')
    Comment.create(post: @post, author: @user,
                   text: 'Comment 2 for Post 1')
  end

  it 'should show the user\'s profile picture.' do
    visit user_posts_path(@user)
    expect(page.find('img')['src']).to have_content('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
  end

  it 'should show the user\'s username.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Tom')
  end

  it 'should show the user\'s number of posts.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Number of Posts: 1')
  end

  it 'checks that I can see a post\'s title.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Post 1')
  end

  it 'checks that I can see some of the post\'s body.' do
    visit user_posts_path(@user)
    expect(page).to have_content('This is the post body')
  end

  it 'checks that I can see the first comments on a post.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Comment 1 for Post 1')
    expect(page).to have_content('Comment 2 for Post 1')
  end
end
