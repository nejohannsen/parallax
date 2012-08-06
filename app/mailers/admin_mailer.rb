class AdminMailer < ActionMailer::Base
  default from: "donotreply@parallax-tripleephotography"
  
  def invite_admin_email(admin, inviter)
    @admin = admin
    @inviter = inviter
    @url  = "#{root_url}invite_admins/#{admin.activation_token}/edit"
    mail(:to => admin.email,
         :subject => "#{@inviter.email} has invited you to be an admin on parallax-tripleephotography.com")
  end
  
  def reset_password_email(admin)
    @admin = admin
    @url  = "#{root_url}password_resets/#{admin.reset_password_token}/edit"
    mail(:to => admin.email, :subject => 'Change password requested')
  end
  
  #def activation_needed_email(admin)
  #  @admin = admin
  #  @url  = "#{root_url}admins/#{admin.activation_token}/activate"
  #  mail(:to => admin.email,
  #       :subject => "Please confirm your account on RichardDawkins.net")
  #end
  
end