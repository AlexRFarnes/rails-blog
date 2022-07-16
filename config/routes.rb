Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # resource      # who answers to the resource (controller#action)
  get "welcome", to: "home#index"
  
  root to: "home#index"

  # get "articles/user/:user_id", to: "articles#from_author"

  resources :articles do 
    get "user/:user_id", to: "articles#from_author", on: :collection
  end

  # get "articles", to: "articles#index"
  # get "articles/new", to: "articles#new"
  # get "articles/:id", to: "articles#show"
  # get "articles/:id/edit", to: "articles#edit"
  # patch "articles/:id", to: "articles#update", as: :article
  # post "articles", to: "articles#create"
  # delete "articles/:id", to: "articles#destroy"
end
