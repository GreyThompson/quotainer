class UserMailer < ActionMailer::Base
  default from: "big_g@quotainer.com"

  def welcome_email(user)
    @user = user
    @url = 'http://www.quotainer.com/sessions/new'
    mail(to: @user.email, subject: 'Welcome to Quotainer')
  end
end
