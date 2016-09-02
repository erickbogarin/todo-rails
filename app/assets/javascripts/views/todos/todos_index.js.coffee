class Kristen.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  initialize: ->
  	@collection.on('add', @appendTodo, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendTodo)
  	this

  appendTodo: (todo) =>
    view = new Kristen.Views.Todo(model: todo)
    @$('.todos').append(view.render().el)
	

