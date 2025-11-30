class UserMailer < ApplicationMailer
  default from: 'Filmster <noreply@paudelmadhav.com.np>'

  def welcome_email(user)
    @user = user
    @url  = 'https://filmster.paudelmadhav.com.np/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to madhav-filmster!')
  end

  def follow_email(user)
    @user = user
    mail(to: @user.email, subject: 'You get new follow at madhav-filmster.')
  end
end
