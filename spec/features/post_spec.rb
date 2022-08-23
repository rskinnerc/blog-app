require 'rails_helper'

RSpec.describe 'Post listig path', type: :feature do
  before do
    @user = User.create(id: 1, name: 'Tom',
                        photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        bio: 'Lorem ipsum dolor sit amet', postscount: 0)
    @user1 = User.create(id: 2, name: 'Lilly',
                         photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                         bio: 'Lorem ipsum dolor sit amet', postscount: 0)
    @post = Post.create(author: @user, title: 'Post 1', text: 'This is the post body', commentscounter: 0,
                        likescounter: 0)
    Comment.create(post: @post, author: @user,
                   text: 'Comment 1 for Post 1')
    Comment.create(post: @post, author: @user1,
                   text: 'Comment 2 for Post 1')
  end

  it 'should show the a post\'s title' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Post 1')
  end

  it 'shows who wrote the post' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Post 1 by Tom')
  end

  it 'check that I can see how many comments it has.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Comments: 2')
  end

  it 'check that I can see how many likes it has.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Likes: 0')
  end

  it 'should show some the post\'s body' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('This is the post body')
  end

  it 'checks that I can see the username of each commentor.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Tom says:')
    expect(page).to have_content('Lilly says:')
  end

  it 'checks that the comment each commentor left.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Tom says: Comment 1 for Post 1')
    expect(page).to have_content('Lilly says: Comment 2 for Post 1')
  end
end
