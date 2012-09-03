class SearchesController < ApplicationController
  
  def index
    @todos = Todo.search(params[:search])
  end
  
end
