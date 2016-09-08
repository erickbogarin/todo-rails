class Kristen.Views.TodoView extends Backbone.View

	className: 'cd-timeline-block'

	template: JST['todos/todo']

	initialize: ->
		@model.on('destroy', @remove, @)

	events: ->
		'click .edit': 'showTodo'
		'click .destroy': 'destroy'
		'click .switch-input': 'toggleCompleted'

	render: ->
	    $(@el).html(@template(todo: @model))
	    @

	showTodo: (e) ->
	    e.preventDefault()
    	Backbone.history.navigate("todos/#{@model.get('id')}", true)

	toggleCompleted: () ->
		@$('.cd-timeline-img').toggleClass('cd-completed')		
		@.model.toggle()

	destroy: () ->
  		this.model.destroy();
