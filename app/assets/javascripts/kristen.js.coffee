window.Kristen =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Kristen.Routers.Todos(todos: $('#container').data('todos'))
    Backbone.history.start(pushState: true)

$(document).ready ->
  Kristen.initialize()
