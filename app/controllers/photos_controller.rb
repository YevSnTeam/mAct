class PhotosController < ApplicationController
  
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
  end
  
end
