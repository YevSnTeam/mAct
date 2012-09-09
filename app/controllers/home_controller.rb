class HomeController < ApplicationController
  def home    
     @categories = Category.all
     @search = Todo.search(params[:search])
     @todos = @search.all.sort_by{rand}
  end
end
