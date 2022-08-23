require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
    before do
        @user = User.create(id: 1, name: 'Tom',
                              photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..', postscount: 0)
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
end
