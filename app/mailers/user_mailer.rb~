
class ApplicationMailer < ActionMailer::Base
  default from: 'monazakria2015@gmail.com'
  layout 'mailer'
end
class UserMailer < ApplicationMailer
  default from: 'monazakria2015@gmail.com'



  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/sign_up'
    @site_name = "localhost"
    mail(:to => user.email, :subject => 'Welcome to my website.')
  end

end
