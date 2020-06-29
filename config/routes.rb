Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bars do
    resources :offers, only:[:create, :new]
  end
  resources :offers, only: [:index, :show, :destroy, :edit, :update] do
    resources :bookings, only: [:create, :index, :show]
  end
get '/dashboard', to: 'dashboards#show'
get '/map', to: 'maps#index'
get '/subscriptions', to: 'subscriptions#index'
resources :orders, only: [:show, :create] do
  resources :payments, only: :new
end

end
