Rails.application.routes.draw do
  resources :searches, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "searches#index"
end
