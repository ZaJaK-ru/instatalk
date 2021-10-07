jQuery(document).on 'turbolinks:load', ->
  App.activity = App.cable.subscriptions.create {
    channel: "ActivityChannel"
  },
  connected: ->

  disconnected: ->

  received: (data) ->
    console.log('Recieved data: ' + data)
