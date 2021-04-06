Rails.application.routes.draw do

  get 'home/index', to: 'home#index'
  get 'home/kiyaku', to: 'home#kiyaku'
  get 'home/privacy', to: 'home#privacy'
  root to: 'home#index'

  devise_for :users
  resources :users

  get 'events/timeline', to: 'events#timeline'
  get 'events/search', to: 'events#search'
  resources :events

  resources :relationships, only: [:create, :destroy]
  get 'relationships/index'
  get 'relationships', to: 'relationships#index'

end
