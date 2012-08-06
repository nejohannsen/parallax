class InviteAdminsController < ApplicationController
  before_filter :require_login, :only => [:new, :create]
  
  def new
    @admin = Admin.new
  end
  
  def create
    if Admin.find_all_by_email(params[:admin][:email]).count < 1
      @admin = Admin.new(params[:admin])
      random_string = SecureRandom.base64(12)
      @admin.password = random_string
      @admin.password_confirmation = random_string
      @admin.activation_state = 'Invited'
      random_string2 = SecureRandom.base64(24)
      random_string2.gsub!('/', 's')
      @admin.activation_token = random_string2
      if @admin.save
        inviter = current_user
        AdminMailer.invite_admin_email(@admin, inviter).deliver
        redirect_to new_invite_admin_path, :notice => "#{t(:admin_invited)} #{@admin.email}"
      else
        redirect_to new_invite_admin_path, :notice => t(:invite_errors)
      end
    else
      redirect_to new_invite_admin_path, :notice => t(:already_has_account)
    end   
  end
  
  def edit
    #authorize! :update, @invite_admin
    @admin = Admin.find_by_activation_token(params[:id])
    not_authenticated unless @admin
  end
  
  def update
    #authorize! :update, @invite_admin
    @admin = Admin.find_by_activation_token(params[:admin][:activation_token])
    if @admin.update_attributes(params[:admin])
      @admin.activate!
      auto_login(@admin)
      redirect_to root_path, :notice => t(:account_created)
   else
     flash[:alert] = t(:failed_admin_creation)
     render :edit
   end
  end
end
