class LinksController < ApplicationController
  
  def index
    @links = Link.all
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to links_path, :notice => "Link created succesfully"
    else
      flash[:alert] = "Failed to create link"
      render :action => 'new'
    end
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    
    if @link.update_attributes(params[:link])
      redirect_to links_path, :notice => "Link Updated Succesfully"
    else
      flash[:alert] = "Failed to Update Link"
      render :action => 'edit'
    end
  end
  
  def destroy
    #todo write destroy stuff
  end
end