class Kristen.Models.Todo extends Backbone.Model
	paramRoot: 'todo'

	toggle: ->
		@save({completed: !@get('completed')})