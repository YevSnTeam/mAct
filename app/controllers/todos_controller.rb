# encoding: utf-8

class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @search = Todo.search(params[:search])
    @todos = @search.all
 
  
  #  @doing = Doing.new
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    
  @todo = Todo.find(params[:id])
  @category = @todo.categories
   # wird spaeter gemacht!!!  @photos = @todo.photos
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
  @todo = Todo.new
   # wird spaeter gemacht!!!     @photo = @todo.photos.build
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
   @todo = Todo.new(params[:todo])
   @todo.categories = Category.find_all_by_id(params[:category_ids]) if params[:category_ids]
   # wird spaeter gemacht!!!    @photo = @todo.photos.build(params[:photo])

    if @todo.save
      redirect_to root_path, notice: 'Todo wurde erfolgreich angelegt'
    else
      render "new"
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    @todo.categories = Category.find_all_by_id(params[:category_ids]) if params[:category_ids]
    
    if @todo.update_attributes(params[:todo])
      redirect_to root_path, notice: 'Todo wurde erfolgreich geändert'
    else
      render "edit"
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :ok }
      format.js
    end  
  end
  
  def to_do
    @todo = Todo.find(params[:id])
    @doing = Doing.new  
    @user = current_user
    @doing.user_id=@user.id
    @doing.todo_id=@todo.id
    @doing.do=true
    
    if @doing.save
      redirect_to root_path, notice: 'Todo wurde erfolgreich hinzugefügt!'
    else
      render "index"
    end
  end
  
  def my_to_dos
    @user=current_user
    @to_dos=@user.todos
    
  end
end
