jQuery(document).on 'turbolinks:load', ->
  App.activity = App.cable.subscriptions.create "ActivityChannel",

  connected: ->

  disconnected: ->

  received: (data) ->
    users = (data['users'].map (user) -> user['nickname'])
    $('#users_online').text(users.join(' '))
