class SessionsController < ApplicationController
  before_filter :require_login, :only => [:destroy]
  
  def new
    redirect_to root_path, :alert => t(:already_logged_in) and return if current_user
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by_email(params[:email])

    if @admin 
      if Admin.authenticate(params[:email], params[:password])
        auto_login(@admin)
        redirect_to root_path, :notice => t(:logged_in)
      elsif @admin.activation_state == 'pending'
        flash.now.alert = t(:account_not_confirmed)
        render :new and return
      else
        flash.now.alert = t(:email_password_invalid)
        render :new
      end
    else
      flash.now.alert = t(:email_password_invalid)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t(:logged_out)
  end
  
  
end