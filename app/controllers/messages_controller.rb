# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_messages

  def index; end

  def create
    message = current_user.messages.build(message_params)
    redirect_to posts_url unless message.save
    message.save
    ActionCable.server.broadcast 'room_channel', content: message.content, first_name: message.user.first_name
  end

  private

  def get_messages
    @messages = Message.for_display
    @message = current_user.messages.build
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
