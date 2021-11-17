Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :campers, only: [:index, :create, :show, :new, :update, :edit, :destroy] do
    resources :bookings, only: [:create, :new, :edit, :update, :destroy]
  end
end
