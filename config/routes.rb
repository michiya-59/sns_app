Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'posts#index'

  resources :posts
  resources :users do
    post :user_confirm, action: :user_confirm_new, on: :new
    
    member do
      get 'setting'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
