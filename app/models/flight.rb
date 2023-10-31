class Flight < ApplicationRecord
  attr_accessor :passengers

  belongs_to :departure_airport, class_name: :Airport
  belongs_to :arrival_airport, class_name: :Airport

  has_many :bookings
  has_many :passengers, through: :bookings

  def formatted_duration
    '%d:%02d' % duration.divmod(60)
  end
end
