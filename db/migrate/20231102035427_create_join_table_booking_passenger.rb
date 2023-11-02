class CreateJoinTableBookingPassenger < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :passengers do |t|
      # t.index %i[booking_id passenger_id]
      # t.index %i[passenger_id booking_id]
    end
  end
end
