class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.co'

  def receipt_email
    @user = params[:user]
    @url = '/'
    mail(to: @user.email, subject: 'Order Receipt')
  end
end
