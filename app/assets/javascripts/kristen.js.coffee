window.Kristen =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	new Kristen.Routers.Todos()
  	Backbone.history.start(pushState: true)

$(document).ready ->
  Kristen.initialize()
