Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [ :index, :show, :create, :update, :destroy ]
        resources :comments, only: [ :index, :create, :destroy ]
      end
    resources :users, only: [ :index, :show ]
  end
end
