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
end
