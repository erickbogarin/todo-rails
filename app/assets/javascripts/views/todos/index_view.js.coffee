class Kristen.Views.TodosIndexView extends Backbone.View

  el: '#container'

  template: JST['todos/index']

  initialize: ->    
    @listenTo(@collection, 'add', @addOne)    
    @render()
    @addAll()    
    @input = @$('#new-todo')

  events:
    'submit #todo-form' : 'create' 
           
  addOne: (todo) ->    
    @view = new Kristen.Views.TodoView(model: todo)
    @$('.todos').append(@view.render().el)

  addAll: ->
    @collection.forEach(@addOne, @)
    
  create: (e) ->    
    e.preventDefault()
    e.stopPropagation()

    if @input.val()
      attributes = name: @input.val()

      @collection.create attributes,
        wait: true
        success: (todo) ->
          @$('#new-todo').val('')

  render: ->    
    $(@el).html(@template())