class UserMailer < ApplicationMailer
  default from: 'test@test.com'

  def welcome_email(user, password)
    @user = user
    @password = password
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
