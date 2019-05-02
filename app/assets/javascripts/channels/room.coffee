App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('messages-table').append '<div class="message">' +
      '<div class="message-user">' + data.first_name + ":" + '</div>' +
      '<div class="message-content">' + data.content + '</div>' + '</div>'
          # Called when there's incoming data on the websocket for this channel
