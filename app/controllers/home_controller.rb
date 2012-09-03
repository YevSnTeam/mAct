class HomeController < ApplicationController
  def home
    @todos = Todo.all
    @categories = Category.all
  end
end
