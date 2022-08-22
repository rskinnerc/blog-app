require 'rails_helper'

RSpec.describe 'Posts nested routes', type: :request do
  before do
    @user = User.create(id: 1, name: 'Tom',
                        photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        bio: 'Lorem ipsum dolor sit amet', postscount: 0)
    @post = Post.create(id: 1, author: @user, title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', text: 'Quis hendrerit dolor magna eget est lorem ipsum.', commentscounter: 0, likescounter: 0)
  end

  context 'GET /users/:user_id/posts' do
    it 'returns a 200 response' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index view' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'renders a html containing "Number of Posts" text' do
      get '/users/1/posts'
      expect(response.body).to include('Number of Posts')
    end
  end

  context 'GET /users/:user_id/posts/:id' do
    it 'returns a 200 response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show view' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'renders a html containing a "Lorem ipsum dolor sit amet, consectetur adipiscing elit" text as title' do
      get '/users/1/posts/1'
      expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
    end
  end
end
