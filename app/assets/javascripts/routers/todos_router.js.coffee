class Kristen.Routers.Todos extends Backbone.Router
	routes:
		'todos': 'index'
		'todos/:id': 'show'
		'*path': 'index'

	initialize: (options) ->	
		@todos = new Kristen.Collections.Todos()
		@todos.reset options.todos

	index: ->		
		@view = new Kristen.Views.TodosIndexView({collection: @todos})
		

	show: (id) ->		
		todo = @todos.get(id)
		@view = new Kristen.Views.TodoEditView({model: todo})
	
	execute: (callback, args, name) ->		
		if @view						
			@view.stopListening()

		if (callback)
			callback.apply(this, args)