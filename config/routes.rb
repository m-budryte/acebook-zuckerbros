# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :messages

  root 'posts#index'
  
  mount ActionCable.server, at: '/cable'

end
