# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    user = User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password")
  end

  it "is valid with valid attributes" do
    user.save
    post = Post.new(message: 'message', user_id: user.id)
    expect(post).to be_valid
  end

  it "is not valid withouth a user" do
    post = Post.new(message: "test")
    expect(post.save).to be_falsey
  end

  it "is not valid without a description" do
    post = Post.new
    expect(post.save).to be_falsey
  end
end
