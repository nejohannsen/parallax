class PasswordResetsController < ApplicationController
    
  # Request password reset.
  # User entered his email in the reset password form and submitted it.
  def create 
    if @admin = User.find_by_email(params[:email]) 
      random_string = SecureRandom.base64(24)
      random_string.gsub!('/', 's')
      @admin.reset_password_token = random_string
      @admin.reset_password_token_expires_at = Time.now + 24.hours
      @admin.reset_password_email_sent_at = Time.now
      if @admin.save
        UserMailer.reset_password_email(@admin).deliver if @admin
      else
        redirect_to(root_path, :alert => 'Failed to save admin') and return
      end

      redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
    else
      redirect_to(root_path, :alert => 'Failed to send email')
    end
  end
    
  # This is the reset password form.
  def edit
    @admin = User.find_by_reset_password_token(params[:id])
    @token = params[:id]
    not_authenticated unless @admin
  end
      
  # This action fires when the admin has sent the reset password form.
  def update
    @token = params[:token]
    @admin = User.find_by_reset_password_token(params[:token])
    not_authenticated unless @admin
    # the next line makes the password confirmation validation work
    @admin.password_confirmation = params[:admin][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if Admin.change_password!(params[:admin][:password])
      redirect_to(root_path, :notice => 'Password was successfully updated.')
    else
      render :action => "edit"
    end
  end
end