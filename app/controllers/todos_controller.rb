# encoding: utf-8

class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.search(params[:search])
    @categories = Category.all
  #  @doing = Doing.new
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    
  @todo = Todo.find(params[:id])
  @category = @todo.category
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
   # wird spaeter gemacht!!!    @photo = @todo.photos.build(params[:photo])

    if @todo.save
      redirect_to todos_path, notice: 'Todo wurde erfolgreich angelegt'
    else
      render "new"
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    
    if @todo.update_attributes(params[:todo])
      redirect_to todos_path, notice: 'Todo wurde erfolgreich geändertt'
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
end
