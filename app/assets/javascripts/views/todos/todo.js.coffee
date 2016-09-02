class Kristen.Views.Todo extends Backbone.View

	template: JST['todos/todo']
	className: 'cd-timeline-block'

	render: ->
		$(@el).html(@template(todo: @model))
		this