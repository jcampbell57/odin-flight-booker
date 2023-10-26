# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# not sure if I need this or not.
# ActiveRecord::Base.transaction do

# faster than destroy all?
# Flight.delete_all
Airport.delete_all

# slower than delete all?
# Flight.destroy_all
# Airport.destroy_all

# reset id to zero
ActiveRecord::Base.connection.reset_pk_sequence!('airports')

# end

airport_codes = %w[LAX OAK SMF SAN SFO SJC MCO ATL ITO HNL OGG KOA LIH MDW ORD BOS GRR
                   STL OMA LAS RNO ABQ BUF JFK LGA MEM BNA AUS DFW IAH SAT SLC SEA]

airport_codes.each do |code|
  Airport.create(code:)
end
