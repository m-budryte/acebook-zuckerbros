# frozen_string_literal: true

class Post < ApplicationRecord
  validates :message, :user_id, presence: true
  belongs_to :user
end
