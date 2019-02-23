class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.co'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Receipt for Order ##{order.id}")
  end
end
