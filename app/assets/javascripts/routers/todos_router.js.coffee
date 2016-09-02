class Kristen.Routers.Todos extends Backbone.Router
	routes:
		'todos': 'index'

	initialize: ->
		@collection = new Kristen.Collections.Todos()
		@collection.reset($('#container').data('todos'))

	index: ->
		view = new Kristen.Views.TodosIndex(collection: @collection)
		$('#container').html(view.render().el)