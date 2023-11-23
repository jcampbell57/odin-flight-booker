class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    passenger_count = params[:passengers].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.new(booking_params)

    # check if a passenger with the same email exists
    @booking.passengers.each do |passenger|
      existing_passenger = Passenger.find_by(email: passenger.email)
      next unless existing_passenger

      # Associate the existing passenger with the booking
      @booking.passengers.delete(passenger) # Remove the new passenger
      @booking.passengers << existing_passenger # Add the existing passenger
    end

    if @booking.save
      # send booking information email
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger:).booking_email.deliver_now
      end

      redirect_to booking_path(@booking), notice: 'Booking created!'
      # redirect_to @booking, notice: 'Booking created!'
    else
      render :new, status: :unprocessable_entity
      # render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
