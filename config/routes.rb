Rails.application.routes.draw do
  resources :makers
  resources :vehicles
  resources :providers
  get "/" => "home#index"

  get "/models" => "models#index"
end
