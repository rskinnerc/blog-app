require 'rails_helper'

RSpec.describe 'User index page: ', type: :feature do
  before do
    @first_user = User.create(id: 1, name: 'Tom',
      photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      bio: 'Lorem ipsum dolor sit amet', email: 'some@example.com', password: 'password')
    @second_user = User.create(id: 2, name: 'Lilly',
      photo: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      bio: 'Lorem ipsum dolor sit amet', email: 'lilly@example.com', password: 'password')
  end

  it 'should show the username of all existing users' do
    visit users_path
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Tom')
  end

  it 'should show the profile picture for each user.' do
    visit users_path
    expect(page.find("##{@first_user.name}-img-#{@first_user.id}")['src']).to have_content('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg')
    expect(page.find("##{@second_user.name}-img-#{@second_user.id}")['src']).to have_content('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg')
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of Posts: 0')
  end
  it 'should redirected to that user\'s show page, when the username is clicked.' do
    visit users_path
    click_on 'Tom'
    expect(page).to have_current_path(user_path(@first_user))
  end
end
