require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @first_user = User.create(id: 1, name: 'Tom',
                             photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..', postscount: 0)
    @second_user = User.create(id: 2, name: 'Lilly',
                              photo: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..', postscount: 0)
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
end
