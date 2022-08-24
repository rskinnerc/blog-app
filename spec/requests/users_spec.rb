require 'rails_helper'

RSpec.describe 'Users routes', type: :request do
  before do
    @user = User.create(id: 1, name: 'Tom',
      photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      bio: 'Lorem ipsum dolor sit amet', email: 'some@example.com', password: 'password')
  end
  context 'GET /users' do
    it 'returns a 200 response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index view' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'renders a html containing a "Tom" title' do
      get '/users'
      expect(response.body).to include('Tom')
    end
  end

  context 'GET /users/:id' do
    it 'returns a 200 response' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show view' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'renders a html containing a "Most recent posts by Tom:" text' do
      get '/users/1'
      expect(response.body).to include('Most recent posts by Tom:')
    end
  end
end
