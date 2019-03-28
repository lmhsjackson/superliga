Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :matches
  resources :players
  resources :leagues
  resources :locations

  resources :home, only: [:index]

  root to: 'home#index'
end
