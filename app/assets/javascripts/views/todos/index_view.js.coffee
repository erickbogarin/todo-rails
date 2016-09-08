class Kristen.Views.TodosIndexView extends Backbone.View

  el: '#container'

  template: JST['todos/index']

  initialize: ->
    @collection.on('add', @addOne, @)
    @render()
    @addAll()
    @input = @$('#new-todo')
  
  events: ->
    'submit #todo-form' : 'createTodo' 

  createTodo: (e) ->    
    e.preventDefault()
    e.stopPropagation()

    if @input.val()
      attributes = name: @input.val()

      @collection.create attributes,
        wait: true
        success: (todo) ->
          @$('#new-todo').val('')
          @$('#message').html('Todo <strong>' + todo.get('name') + '</strong> has been successfully registered!')
            
  addAll: ->
    @collection.forEach(@addOne, @)

  render: ->
    $(@el).html(@template())
    @

  addOne: (todo) ->
    @view = new Kristen.Views.TodoView(model: todo)
    @$('.todos').append(@view.render().el)