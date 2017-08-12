Rails.application.routes.draw do
  root to: 'home#index'
  match '/vote-no-destino', to: 'surveys#create', via: :get

  resource :home, only: :index
  resources :options, only: [:index, :new, :create, :destroy]
  resources :surveys, only: [:create, :edit, :update, :show] do
    resources :questions, only: [:edit, :update]
  end
end
