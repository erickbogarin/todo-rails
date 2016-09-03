class Kristen.Views.TodoView extends Backbone.View
	
	template: JST['todos/todo']
	className: 'cd-timeline-block'

	events: ->
		'click .cd-read-more': 'showTodo'

	render: ->
	    $(@el).html(@template(todo: @model))
	    @

	showTodo: (e) ->
	    e.preventDefault()
    	Backbone.history.navigate("todos/#{@model.get('id')}", true)