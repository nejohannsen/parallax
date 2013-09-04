class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to photos_path, :notice => "Photo created succesfully"
    else
      flash[:alert] = "Failed to create photo"
      render :action => 'new'
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    
    if @photo.update_attributes(params[:photo])
      redirect_to photos_path, :notice => "Photo Updated Succesfully"
    else
      flash[:alert] = "Failed to Update Photo"
      render :action => 'edit'
    end
  end
  
  def destroy
    #todo write destroy stuff
  end
end