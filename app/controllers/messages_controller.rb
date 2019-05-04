class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_messages

  def index
    # p @message
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel', content: message.content, first_name: message.user.first_name
    end
  end 

  private

  def get_messages
    @messages = Message.for_display
    @message = current_user.messages.build
  end

  def message_params
    params.require(:message).permit(:content)
  end

  # def render_message(message)
  #   render(partial: 'message', locals: { message: message })
  # end
end
