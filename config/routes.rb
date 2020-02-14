Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    # users/:id/以下
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :microposts,          only: [:create, :show, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
