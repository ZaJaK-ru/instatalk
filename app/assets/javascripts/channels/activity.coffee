jQuery(document).on 'turbolinks:load', ->
  App.activity = App.cable.subscriptions.create "ActivityChannel",

  connected: ->

  disconnected: ->

  received: (data) ->
    current_user = data.user

    if current_user.online && $("span[id='user_#{current_user.id}'").length == 0
      $('#users_online').append("<span id='user_#{current_user.id}' > #{current_user.nickname} </span>")
    else if !current_user.online
      $("span[id='user_#{current_user.id}'").remove()
