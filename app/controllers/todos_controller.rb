class TodosController < ApplicationController
  #before_action :authenticate_user!
  def index
  	respond_with Todo.all
  end

  def show
  	respond_with Todo.find(params[:id])
  end

  def destroy
    respond_with Todo.destroy(params[:id])
  end

  def update
    respond_with Todo.update(params[:id], todo_params)
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
