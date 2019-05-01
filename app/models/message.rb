class Message < ApplicationRecord
  belongs_to :user
  scope :for_display, -> { order(:created_at).last(50) }
end
