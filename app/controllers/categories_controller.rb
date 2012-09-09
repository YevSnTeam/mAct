# encoding: utf-8
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to categories_path, notice: 'Kategorie wurde erfolgreich angelegt'
    else
      redirect_to categories_path , :flash => {:error => "Kategorie existiert bereits" }
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: 'Kategorie wurde erfolgreich geändert'
    else
      redirect_to categories_path , :flash => {:error => "Kategorie existiert bereits" }
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Kategorie wurde erfolgreich gelöscht'
  end
end
