class Kristen.Views.TodoView extends Backbone.View

	template: JST['todos/todo']
	className: 'cd-timeline-block'

	initialize: ->
		@model.on('destroy', @remove, @)

	events: ->
		'click .edit': 'showTodo'
		'click .destroy': 'destroy'

	render: ->
	    $(@el).html(@template(todo: @model))
	    @

	showTodo: (e) ->
	    e.preventDefault()
    	Backbone.history.navigate("todos/#{@model.get('id')}", true)

	destroy: () ->
  	this.model.destroy();
