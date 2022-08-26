Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in: 'login'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show]  do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :posts, only: [:new, :create, :destroy]

  #api routes
  namespace :api do
    resources :users, only: []  do
      resources :posts, only: [:index] do  #users/1/posts users/2/posts/1/comments
        resources :comments, only: [:index, :create]  #users/1/posts/1/comments/
      end
    end
  end
end
