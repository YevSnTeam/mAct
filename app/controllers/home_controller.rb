class HomeController < ApplicationController
  def home
    @todos = Todo.search(params[:search])
    @categories = Category.all
  end
end
