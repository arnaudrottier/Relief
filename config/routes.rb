Rails.application.routes.draw do

devise_for :users
root to: 'pages#home'
get "my_house", to: "houses#show"
get 'users/onboard', to: "users#onboard", as: :onboard
resources :users, only: [:show, :edit, :update]
resources :whiteboard_messages, only: [:new, :create, :destroy]
resources :room_chores, only: [:show, :edit, :update] # show will be partial displayed on homepage
resources :chores, only: [:index]
resources :amenities, only: [:index] do
  resources :bookings, only: [:new, :create, :destroy]
end
post 'line/webhook', to: "line/bot#receive"

# namespace :admin do
  # resources :chores
  # resources :amenities
  # resources :rooms, only: [:new, :create, :edit, :update, :destroy]
  # auto create :room_chores?
# end
end
