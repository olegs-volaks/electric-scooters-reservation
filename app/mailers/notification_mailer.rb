class NotificationMailer < ApplicationMailer

  def notification(reservation_id, unsubscribe_token)
    @reservation = Reservation.find(reservation_id)
    @unsubscribe_token = unsubscribe_token
    mail(to: @reservation.employee.email, subject: t('.subject'))
  end

end
