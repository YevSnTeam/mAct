class MytodosController < ApplicationController
  
  def index
    @user=current_user
    @to_dos=@user.todos
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    @doing = Doing.find(params[:id])
    @doing.destroy
  end
end
