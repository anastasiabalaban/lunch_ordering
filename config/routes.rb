Rails.application.routes.draw do
  root 'menus#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[index]
  resources :items
  resources :menus
  resources :orders
end
