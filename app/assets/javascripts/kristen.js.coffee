window.Kristen =
  dispatcher: _.clone(Backbone.Events)
  Models: {}
  Collections: {}
  Views: {}
  Routers: { todos: null }
  initialize: ->
  	@.Routers.todos = new Kristen.Routers.Todos(
      todos: $('#container').data('todos'),
      appView: new Kristen.Views.AppView()
    )
  	#@.Routers.todos.on('route:index', () ->
  	#	console.log('test')
  	#)
  	Backbone.history.start(pushState: true)  	

$(document).ready -> 
  Kristen.initialize()  
