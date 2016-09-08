class TodosController < ApplicationController
  
  #before_action :authenticate_user!
  
  def index
    @todos = Todo.where(user_id: current_user.id).order(:name)
  	respond_with @todos
  end

  def show
  	respond_with Todo.find(params[:id])
  end

  def create 
    todo = Todo.new
    todo.name = params[:name]
    todo.user_id = current_user.id
    todo.save
    respond_with todo
  end

  def destroy
    respond_with Todo.destroy(params[:id])
  end

  def update
    respond_with Todo.update(params[:id], todo_params)
  end

  def todo_params
    params.require(:todo).permit(:name, :description, :completed, :user_id)
  end

end
