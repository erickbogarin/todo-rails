class TodosController < ApplicationController
  #before_action :authenticate_user!
  def index
  	respond_with Todo.all
  end

  def show 
  	respond_with Todo.find(params[:id])
  end
  
end
