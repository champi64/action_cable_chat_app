App.room = App.cable.subscriptions.create "RoomChannel",
  # Called when the subscription is ready for use on the server
  connected: ->

  # Called when the subscription has been terminated by the server
  disconnected: ->

  # Called when there's incoming data on the websocket for this channel
  received: (data) ->
    unless data.message.blank?
      $('#messages-table').append data.message
      scrollToBottom()

$(document).on 'turbolinks:load', () ->
  submit_message()
  scrollToBottom()

submit_message = ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $("[value='Send']").click()
      event.target.value = ''
      event.preventDefault()

scrollToBottom = ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
