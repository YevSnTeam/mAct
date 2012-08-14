class PhotosController < ApplicationController
  
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def index
    @photos = Photo.all
  end
end
