Rails.application.routes.draw do

  devise_for :users
  
  root 'events#index'
  
  resources :events

  resources :relationships, only: [:create, :destroy]

  get 'relationships/index'
  get 'relationships', to: 'relationships#index'

end
