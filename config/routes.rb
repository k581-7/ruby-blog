Rails.application.routes.draw do
  # get "home/index"
  # get "users/index"
  # get "users/show"
  # get "users/new"
  # get "users/edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/articles" => "articles#index"
  get "/articles/new" => "articles#new", as: 'new_article'
  post "/articles" => "articles#create", as: 'create_article'
  get "/articles/:id" => "articles#show", as: "article"
  get "/articles/:id/edit" => "articles#edit", as: "edit_article"
  patch "/articles/:id" => "articles#update"
  put "/articles/:id" => "articles#update"
  delete "/articles/:id" => "articles#delete", as: "delete_article"

  # Users routes (new routes to add)
  get "/users" => "users#index"
  get "/users/new" => "users#new", as: "new_user"
  post "/users" => "users#create", as: "create_user"
  get "/users/:id" => "users#show", as: "user"
  get "/users/:id/edit" => "users#edit", as: "edit_user"
  patch "/users/:id" => "users#update"
  put "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy", as: "delete_user"

    resources :articles do
    resources :comments, only: [:create ]
    
  end
  root "home#index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
