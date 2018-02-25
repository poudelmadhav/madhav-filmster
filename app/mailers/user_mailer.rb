class UserMailer < ApplicationMailer
  default from: 'notifications@madhav-filmster.herokuapp.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://madhav-filmster.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to madhav-filmster!')
  end

  def follow_email(user)
    @user = user
    mail(to: @user.email, subject: 'You get new follow at madhav-filmster.')
  end
end
