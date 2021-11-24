Rails.application.routes.draw do
  resources :tasks
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"
  resources :publishers
  resource :profile, only: %i(show, edit update)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
