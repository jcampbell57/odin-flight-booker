Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  root 'flights#index'
  resources :flights, only: :index
  resources :bookings, only: %i[new create show]
end
