class Kristen.Views.TodosIndexView extends Backbone.View

  el: '#container'

  template: JST['todos/index']

  initialize: ->
    @render()
    @addAll()
    
  addAll: ->
    @collection.forEach(@addOne, @)

  render: ->
    $(@el).html(@template())
    @

  addOne: (todo) =>
    @view = new Kristen.Views.TodoView(model: todo)
    @$('.todos').append(@view.render().el)
