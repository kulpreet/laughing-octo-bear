class TodosController < ApplicationController

  doorkeeper_for :all  

  def index
    @todos = current_user.todos
  end

  def create
    
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = current_user.todos.where("todos.id" => params[:id]).first
  end

  def show
    @todo = current_user.todos.where("todos.id" => params[:id]).first
  end

  def update
    @todo = current_user.todos.where("todos.id" => params[:id]).first    
  end

  def destroy
    @todo = current_user.todos.where("todos.id" => params[:id]).first    
    @todo.destroy
    redirect_to :action => :index
  end
  
  
end
