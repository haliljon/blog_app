require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'should render the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'should test placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get '/users/1/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'should render the show template' do
      get '/users/1/posts/show'
      expect(response).to render_template(:show)
    end

    it 'should test placeholder text' do
      get '/users/1/posts/show'
      expect(response.body).to include('Show Post')
    end
  end
end
