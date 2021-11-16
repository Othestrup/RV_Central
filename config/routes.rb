Rails.application.routes.draw do
  root to: 'pages#home'

  resources :campers, only: [:index, :show] do
    rwsources :bookings, only: [:new, :create]
  end

  resources :bookings

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
