Rails.application.routes.draw do
  match '/vote-no-destino', to: 'surveys#create', via: :get

  resources :options, only: [:index, :new, :create, :destroy]
  resources :surveys, only: [:create, :edit, :update, :show] do
    resources :questions, only: [:edit, :update]
  end
end
