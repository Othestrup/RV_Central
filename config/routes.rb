Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :create, :new]

  resources :campers, only: [:index, :create, :new, :update, :edit, :destroy] do
    resources :bookings, only: [:create, :new, :edit, :update, :destroy]
  end
end
