require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
    before do
        @user = User.create(id: 1, name: 'Tom',
                              photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet', postscount: 0)
        Post.create(author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', commentscounter: 0,
                    likescounter: 0)
        Post.create(author: @user, title: 'Post 2', text: 'Lorem ipsum dolor sit amet', commentscounter: 0,
                    likescounter: 0)
        Post.create(author: @user, title: 'Post 3', text: 'Lorem ipsum dolor sit amet', commentscounter: 0,
                    likescounter: 0)
        Post.create(author: @user, title: 'Post 4', text: 'Lorem ipsum dolor sit amet', commentscounter: 0,
                    likescounter: 0)
        @post5 = Post.create(author: @user, title: 'Post 5', text: 'Lorem ipsum dolor sit amet', commentscounter: 0,
                             likescounter: 0)
    end

    it 'should show the user\'s profile picture.' do
        visit user_path(@user)
        expect(page.find('img')['src']).to have_content('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      end
      it 'should show the user\'s username.' do
        visit user_path(@user)
        expect(page).to have_content('Tom')
      end
      it 'should show the user\'s number of posts.' do
        visit user_path(@user)
        expect(page).to have_content('Number of Posts: 5')
      end
      it 'should show the user\'s bio.' do
        visit user_path(@user)
        expect(page).to have_content('Lorem ipsum dolor sit amet')
      end

      it 'should show the user\'s first 3 posts.' do
        visit user_path(@user)
        expect(page).to have_content('Post 5')
        expect(page).to have_content('Post 4')
        expect(page).to have_content('Post 3')
        expect(page).to_not have_content('Post 2')
      end

      it 'should show a button that lets me view all of a user\'s posts.' do
        visit user_path(@user)
        expect(page).to have_content('See all posts')
      end
end
