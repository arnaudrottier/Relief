Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
get "my_house", to: "houses#show"
resources :whiteboard_messages, only: [:new, :create]
resources :room_chores, only: [:show, :edit, :update] # maybe no show?
resources :chores, only: [:index]
resources :amenities, only: [:index] do
  resources :bookings, only: [:new, :create, :destroy]
end

# namespace :admin do
  # resources :chores
  # resources :amenities
  # resources :rooms, only: [:new, :create, :edit, :update, :destroy]
  # auto create :room_chores?
# end
end
