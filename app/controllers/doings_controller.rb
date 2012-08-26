# encoding: utf-8
class DoingsController < ApplicationController
   
   def show
     @doing=Todo.find(params[:id])    
   end
   
   def index
    @user=current_user
    @to_dos=@user.todos
  end
  
  
  def destroy    
    @todo = Todo.find(params[:id])
    @user = current_user
    @doing =  @user.todos.delete(@todo)
    redirect_to '/doings', notice: "gelöscht"    
  end
  
  def done
    
  end
end
