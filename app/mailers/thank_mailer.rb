class ThankMailer < ApplicationMailer
  def welcome_email(user)    
    @user = user
    mail(to: @user.email, subject: 'ご登録のご案内')
  end
end
