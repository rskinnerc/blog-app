Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/:id/posts", to: "posts#index", as: "user_posts"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: "user"
end
