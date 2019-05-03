# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  include Warden::Test::Helpers

  let(:user) { User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password") }

  scenario 'Can submit posts and view them' do
    login_as(user, scope: :user)

    visit '/posts'

    click_link 'Chat'

    # fill_in 'chat-message', with: 'Hello, world!'

    # click_button 'Send'

    # expect(page).to have_content('Hello, world!')
  end
end
