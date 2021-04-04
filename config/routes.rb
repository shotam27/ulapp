Rails.application.routes.draw do

  devise_for :users
  resources :users

  get 'events/timeline', to: 'events#timeline'
  root 'events#index'
  resources :events

  resources :relationships, only: [:create, :destroy]
  get 'relationships/index'
  get 'relationships', to: 'relationships#index'

end
