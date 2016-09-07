class Kristen.Collections.Todos extends Backbone.Collection
  url: '/api/todos'	
  model: Kristen.Models.Todo
  comparator: (todo )->
  	todo.get('name')
