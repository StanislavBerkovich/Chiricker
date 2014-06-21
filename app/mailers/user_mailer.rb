class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Ваш аккаунт зарегистрирован в Chiricker')
  end
end
