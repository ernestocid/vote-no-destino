Rails.application.routes.draw do
  match '/vote-no-destino', to: 'surveys#create', via: :get

  resources :options
  resources :surveys do
    resources :questions
  end
end
