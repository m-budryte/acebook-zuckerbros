# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { user = User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password") }

  describe 'GET /new ' do
    it 'responds with 200' do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      sign_in user
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      sign_in user
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be_truthy
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /' do
    it 'shows a post page' do
      sign_in user
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!')

      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    it 'returns user to edit page if no update params'
  end
end
