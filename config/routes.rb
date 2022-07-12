Rails.application.routes.draw do
  resources :users
  resources :user_permissions
  resources :permissions
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
