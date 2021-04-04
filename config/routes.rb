Rails.application.routes.draw do

  root 'events#index'

  devise_for :users
  resources :users

  get 'events/timeline', to: 'events#timeline'  
  get 'events/search', to: 'events#search'
  resources :events

  resources :relationships, only: [:create, :destroy]
  get 'relationships/index'
  get 'relationships', to: 'relationships#index'

end
