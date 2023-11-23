class PassengerMailer < ApplicationMailer
  default from: email_address_with_name('notification@fake-flights.com', 'Fake Flight Co Notifications')

  def booking_email
    @passenger = params[:passenger]
    @url = 'http://example.com/'
    @flight = Flight.find(@passenger.bookings.last.flight_id)
    mail(to: @passenger.email, subject: 'Your (fake) flight is booked!')
  end
end
