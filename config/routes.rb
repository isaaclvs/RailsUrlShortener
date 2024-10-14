Rails.application.routes.draw do
  root "urls#new"
  resources :urls, only: [:new, :create, :show]
  
  get "/:short_url", to: "urls#redirect_to_original"
end


