class Kristen.Views.TodoView extends Backbone.View

	className: 'cd-timeline-block'

	template: JST['todos/todo']

	initialize: ->		
		@listenTo(@model, 'destroy', @remove)

	events:
		'click .edit': 'showTodo'
		'click .destroy': 'destroy'
		'click .switch-input': 'toggleCompleted'

	render: ->		
		$(@el).html(@template(todo: @model))		
		@

	showTodo: (e) ->		
		e.stopPropagation()			
		Kristen.Routers.todos.navigate("todos/#{@model.get('id')}", true)

	toggleCompleted: () ->
		@$('.cd-timeline-img').toggleClass('cd-completed')		
		@.model.toggle()

	destroy: () ->
  		@model.destroy()
  		this.remove()
  		return false

  	onClose: () ->
  		@model.unbind('change', @render)
