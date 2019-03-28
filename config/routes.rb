Rails.application.routes.draw do
  get 'participants/index'
  get 'participants/new'
  get 'participants/show'
  get 'participants/create'
  get 'participants/update'
  get 'participants/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players
  resources :leagues do
    resources :matches
    resources :participants
  end

  resources :locations

  resources :home, only: [:index]

  root to: 'home#index'
end
