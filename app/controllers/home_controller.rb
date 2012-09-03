class HomeController < ApplicationController
  def home
    
    @categories = Category.all
     @search = Todo.search(params[:search])
     @todos = @search.all
  end
end
