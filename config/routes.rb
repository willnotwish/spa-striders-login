Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  
  root to: 'home#index'
end
