# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

FLIGHT_DURATIONS = {
  'SFO' => {
    'MSY' => 245,
    'JFK' => 335,
    'SEA' => 140
  },
  'MSY' => {
    'SFO' => 295,
    'JFK' => 185,
    'SEA' => 320
  },
  'JFK' => {
    'SFO' => 395,
    'MSY' => 205,
    'SEA' => 375
  },
  'SEA' => {
    'SFO' => 130,
    'MSY' => 275,
    'JFK' => 320
  }
}

def random_time
  now = Time.now
  a_day_ago = now - 60 * 60 * 24
  rand(a_day_ago..now)
end

# not sure if I need this or not.
# ActiveRecord::Base.transaction do

# faster than destroy all?
Flight.delete_all
Airport.delete_all

# slower than delete all?
# Flight.destroy_all
# Airport.destroy_all

# reset id to zero
ActiveRecord::Base.connection.reset_pk_sequence!('flights')
ActiveRecord::Base.connection.reset_pk_sequence!('airports')

# end

Airport.create(code: 'SFO', name: 'San Francisco International Airport', city: 'San Francisco')
Airport.create(code: 'MSY', name: 'Louis Armstrong New Orleans International Airport', city: 'New Orleans')
Airport.create(code: 'JFK', name: 'John F. Kennedy International Airport', city: 'New York')
Airport.create(code: 'SEA', name: 'Seattle Tacoma International Airport', city: 'Seattle / Tacoma')

Date.today.upto(Date.today + 30.days).each do |potential_date|
  Airport.all.each do |origin_airport|
    Airport.all.each do |destination_airport|
      next if origin_airport == destination_airport

      3.times do
        Flight.create(duration: FLIGHT_DURATIONS[origin_airport.code][destination_airport.code],
                      date: potential_date,
                      time: random_time,
                      departure_airport: origin_airport,
                      arrival_airport: destination_airport)
      end
    end
  end
end
