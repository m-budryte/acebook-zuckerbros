# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password") }

  let(:valid_attributes) do
    return { message: "MyString", user_id: user.id }
  end

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
    context "with valid params" do
      it 'updates the requested post' do
        sign_in user

        post = Post.create(message: 'text', user_id: user.id)

        put :update, params: { id: post.id, post: { message: "new post" } }

        post.reload

        expect(response).to redirect_to '/posts'
      end

      it 'redirect to edit partial if invalid update' do
        sign_in user

        post = Post.create(message: 'text', user_id: user.id)

        put :update, params: { id: post.id, post: { message: "" } }

        expect(response).to render_template :edit
      end
    end
  end
end
