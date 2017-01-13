window.Kristen =
  dispatcher: _.clone(Backbone.Events)
  Models: {}
  Collections: {}
  Views: {}
  Routers: { todos: null }
  initialize: ->
  	@.Routers.todos = new Kristen.Routers.Todos(
      todos: $('#container').data('todos')
    )  	
  	Backbone.history.start(pushState: true)  	

$(document).ready -> 
  Kristen.initialize()  
