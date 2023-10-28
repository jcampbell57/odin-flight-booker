class FlightsController < ApplicationController
  def index
    # @flight = params[:flight] ? Flight.new(search_params) : Flight.new

    @flights = Flight.all.order(:date, :time)
    return unless params[:flight]

    # Check if departure_airport or arrival_airport was provided in the search
    departure_airport = Airport.find_by(code: params[:flight][:departure_airport_id])
    arrival_airport = Airport.find_by(code: params[:flight][:arrival_airport_id])
    if departure_airport && arrival_airport
      @flights = @flights.where(departure_airport_id: departure_airport.id, arrival_airport_id: arrival_airport.id)
    elsif departure_airport
      @flights = @flights.where(departure_airport_id: departure_airport.id)
    elsif arrival_airport
      @flights = @flights.where(arrival_airport_id: arrival_airport.id)
    end

    # Check if a date was provided in the search
    return unless params[:flight][:date].present?

    @flights = @flights.where(date: params[:flight][:date])
  end

  private

  # search_params is designed to build the Flight object that will populate the search params
  # on a redirect after a search (it includes :tickets which is not in the db table)

  # flight_params is used to query the database

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end

  # def search_params
  # params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date, :passengers)
  # end
end
