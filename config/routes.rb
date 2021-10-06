# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'posts#index'

  resources :likes, only: [:destroy]
  resources :posts do
    resources :likes, only: [:create]
  end

  resources :users do
    post :user_confirm, action: :user_confirm_new, on: :new
    member do
      get 'setting'
      get :following, :followers
      get :likes_list
    end
    resource :relationships, only: [:destroy]
    resources :relationships, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
