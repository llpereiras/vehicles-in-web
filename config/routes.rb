Rails.application.routes.draw do
  get "/" => "home#index"
  get "/makers" => "makers#index", defaults: {format: :json}
  get "/makers/:maker_id/vehicles" => "vehicles#index", defaults: {format: :json}
end
