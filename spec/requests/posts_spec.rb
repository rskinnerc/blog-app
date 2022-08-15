require 'rails_helper'

RSpec.describe 'Posts nested routes', type: :request do
  context 'GET /users/1/posts' do
    it 'returns a 200 response' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index view' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'renders a html containing a <h1>Here is a list of posts for a given user</h1> tag' do
      get '/users/1/posts'
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end
end