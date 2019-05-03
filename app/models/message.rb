# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  scope :for_display, -> { order(created_at: :desc).first(50) }
end
