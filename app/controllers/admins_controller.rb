class AdminsController < ApplicationController
  before_filter :require_login
  
  def index
    @admins = Admin.all
  end
  
  #def new
  #  @admin = Admin.new
  #end
  #
  #def create
  #  @admin = Admin.new(params[:id])
  #end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:admin])
  end
  
  def show
    @admin = Admin.find(params[:id])
  end
end