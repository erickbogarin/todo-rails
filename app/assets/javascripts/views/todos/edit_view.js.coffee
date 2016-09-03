class Kristen.Views.TodoEditView extends Backbone.View
	
	el: '#container'

	template: JST['todos/edit']

	initialize: ->
    	@render()
	
	render: ->
		$(@el).html(@template(todo: @model))
		@