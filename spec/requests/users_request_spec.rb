require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'should render the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'should test placeholder text' do
      get '/users'
      expect(response.body).to include('List of All users')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'should render the show template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end

    it 'should test placeholder text' do
      get '/users/show'
      expect(response.body).to include('Show users with particular ID')
    end
  end
end
