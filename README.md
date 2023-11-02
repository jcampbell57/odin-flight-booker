# README

This is a rails app which allows users to:
* Enter desired dates / airports and click “Search”
* Choose from among a list of available flights
* Enter passenger information for all passengers

This app makes use of:
* a PostgreSQL database
* simple-form gem

I hope to gain more familiarity with:
* Rails associations
* the simple-form gem

More project info:
* Ruby version 3.2.2
* Link to project description: https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker

I found these resources helpful during this project:
* https://shaqqour.medium.com/how-to-create-a-model-with-two-foreign-keys-references-from-the-same-table-in-rails-1d0ebc744544
* https://stackoverflow.com/questions/39056615/after-destroying-all-records-why-are-new-objects-being-created-with-an-id-higher
* https://stackoverflow.com/questions/31820352/at-forms-required-true-is-not-working
* https://github.com/andrewjh271/odin_flight_booker/
* https://chat.openai.com/

Misc terminal setup:
* rails new odin-flight-booker --database=postgresql
* add credentials to config/database.yml, then rails db:create
* bundle install (gem 'simple_form')
* rails generate simple_form:install 
* rails g model Airports code:string
* rails g model Flight duration:integer date:date time:time origin_id:references destination_id:references
* rails g controller Flights
* rails g model Booking flight:references
* rails g model Passenger name:string email:string:index
* rails g controller Bookings new create show
* rails g migration CreateJoinTableBookingPassenger booking passenger

This project could be improved:
* by adding styling
