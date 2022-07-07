Rails.application.routes.draw do
      # resource      # who answers to the resource (controller#action)
  get "welcome", to: "home#index"
  get "articles/new", to: "articles#new"
  post "articles", to: "articles#create"
end
