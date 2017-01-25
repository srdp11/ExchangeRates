class UserMailer < ApplicationMailer
  default from: 'xenom95@mail.ru'
  #default subject: 'Notification about rates'

  def notification_email(email, text)
    mail(to: email, body: text)
  end
end
