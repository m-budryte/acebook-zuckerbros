App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

      html = '<div class="message">'
      html += '<div class = "msg-bubble">'
      html += '<div class = "msg-info">'
      html += '<div class="message-user"><strong>'
      html += data.first_name
      html += ':</strong></div>'
      html += '<div class="message-time">'
      html += new Date().toLocaleString()
      html += '</div>'
      html += '</div>'
      html += '<div class="message-content"><p>'
      html += data.content 
      html += '</p></div></div></div>'

      $('#messages-table').append(html)
      $('#messages-table').scrollTop($('#messages-table')[0].scrollHeight);


      

    # Called when there's incoming data on the websocket for this channel
