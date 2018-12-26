Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[index]
  resources :items
  resources :orders
end
