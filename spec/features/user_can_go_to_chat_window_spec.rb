# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Messages', type: :feature do
  include Warden::Test::Helpers

  let(:user) { user = User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password") }

  scenario 'User can go to chat window' do
    login_as(user, scope: :user)

    visit '/posts'

    click_link 'Chat'

    expect(current_path).to eq('/messages')
  end
end
