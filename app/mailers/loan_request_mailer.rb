class LoanRequestMailer < ApplicationMailer
  def send_email(user)
    @user = user
    @url  = 'http://esential-2016.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
