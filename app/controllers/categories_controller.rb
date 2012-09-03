# encoding: utf-8
class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, notice: 'Kategorie wurde erfolgreich angelegt'
    else
      render "new"
    end
   end
  
  def show
    @category = Category.find(params[:id]) 
    @categories = Category.all
  end
  
  def index
    @categories = Category.all
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: 'Kategorie wurde erfolgreich geändertt'
    else
      render "edit"
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Kategorie wurde erfolgreich gelöscht'
  end
  
  
end
