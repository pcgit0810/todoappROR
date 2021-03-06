Rails.application.routes.draw do
  
  root to: "main#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "user/list", to: "registrations#index"
  delete "user/delete", to: "registrations#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  # get "dashboard", to: "userdashboards#new"
  resources :todo_list
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
