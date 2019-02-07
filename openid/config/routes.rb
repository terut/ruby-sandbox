Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "users#index"

  get "/login", to: "logins#new"
  post "/login", to: "logins#create"
  get "/logout", to: "logins#destroy"
end
