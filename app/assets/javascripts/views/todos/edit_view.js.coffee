class Kristen.Views.TodoEditView extends Backbone.View
	el: '#container'

	template: JST['todos/edit']
	
	events: ->
		'click .cancel' : 'cancel'
		'submit #edit-todo' : 'update'

	initialize: ->
		@render()

	render: ->		
		$(@el).html(@template(todo: @model))
		
	cancel: (e) ->		
		e.stopPropagation()
		Kristen.Routers.todos.navigate("todos", true)

	update: (e) ->
		e.preventDefault()
		e.stopPropagation()
		@model.save @newAttributes(),
		success: (todo) ->			
			wait: true
			Kristen.Routers.todos.navigate("todos", true)

	newAttributes: -> { 
		name: @.$('#name').val(),
		description: @.$('#description').val() 
	}
