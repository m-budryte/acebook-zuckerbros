# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(email: 'test@test.com', first_name: "John", last_name: "Snow", password: "password", password_confirmation: "password") }

  let(:valid_attributes) do
    return { message: "MyString", user_id: user.id }
  end
end
