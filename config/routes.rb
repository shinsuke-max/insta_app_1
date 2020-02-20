Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/signup',                  to: 'users#new'
  get    '/login',                   to: 'sessions#new'
  post   '/login',                   to: 'sessions#create'
  delete '/logout',                  to: 'sessions#destroy'
  get '/auth/:provider/callback',    to: 'users#facebook_login',      as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure',        as: :auth_failure
  resources :users do
    # users/:id/以下
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :relationships,       only: [:create, :destroy]
  resources :microposts,          only: [:create, :show, :destroy] do
    resources :likes,               only: [:create, :destroy]
    resources :comments,            only: [:create, :destroy]
  end

end
