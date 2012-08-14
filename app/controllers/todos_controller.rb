# encoding: utf-8

class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
    @todo = Todo.new
    @categories = Category.all
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    
  @todo = Todo.find(params[:id])
  @category = @todo.category
   # wird spaeter gemacht!!!  @photos = @todo.photos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
  @todo = Todo.new
   # wird spaeter gemacht!!!     @photo = @todo.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
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

    
    respond_to do |format|
      if @todo.save 
        # wird spaeter gemacht!!! && @photo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' } 
        format.json { render json: @todo, status: :created, location: @todo }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo]) 
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
      format.js
    end
  end
end
