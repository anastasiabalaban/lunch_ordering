# frozen_string_literal: true

Rails.application.routes.draw do
  root 'menus#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users,  only:   %i[index]
  resources :items,  except: %i[show]
  resources :menus,  only:   %i[index show new create]
  resources :orders, only:   %i[index new create]
end
